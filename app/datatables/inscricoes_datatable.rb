class InscricoesDatatable
    delegate :params, :h, :t, :link_to, :button_to, :content_tag, 
        :inscricao_path, 
        :edit_inscricao_path, to: :@view
  
    
    def initialize(view)
        @view = view
        @remote = params[:remote] == 'true'
    end

    def as_json(_options = {})
        {
            draw: params[:draw].to_i,
            recordsTotal: total,
            recordsFiltered: inscricoes.total_count,
            data: data
        }
    end

    private 
        def data
            inscricoes.each_with_index.map do |inscricao, index|
                {
                    'index' => (index + 1) + ((page - 1) * per_page),
                                            
                                            
                            'nome' => column_nome(inscricao),
                        
                                            
                            'sexo' => column_sexo(inscricao),
                        
                                            
                            'data_nascimento' => column_data_nascimento(inscricao),
                        
                                            
                            'cidade' => column_cidade(inscricao),
                        
                                            
                            'nome_pai' => column_nome_pai(inscricao),
                        
                                            
                            'nome_mae' => column_nome_mae(inscricao),
                        
                                            
                            'rg' => column_rg(inscricao),
                        
                                            
                            'cpf' => column_cpf(inscricao),
                        
                                            
                            'orgao_expedidor' => column_orgao_expedidor(inscricao),
                        
                                            
                            'data_expedicao' => column_data_expedicao(inscricao),
                        
                                            
                            'celular' => column_celular(inscricao),
                        
                                            
                            'telefone_residencial' => column_telefone_residencial(inscricao),
                        
                                            
                            'pagamento_matricula' => column_pagamento_matricula(inscricao),
                                            
                                            
                            'created_at' => column_created_at(inscricao),
                        
                                            
                            'updated_at' => column_updated_at(inscricao),
                        
                    
                    'opcoes' => column_opcoes(inscricao)
                }
            end
        end


                    
                    
                def column_nome(inscricao)
                    
                        inscricao.try(:nome)
                    
                end
            
                    
                def column_sexo(inscricao)
                    
                        inscricao.try(:sexo)
                    
                end
            
                    
                def column_data_nascimento(inscricao)
                    
                        inscricao.try(:data_nascimento)
                    
                end
            
                    
                def column_cidade(inscricao)
                    
                        inscricao.try(:cidade)
                    
                end
            
                    
                def column_nome_pai(inscricao)
                    
                        inscricao.try(:nome_pai)
                    
                end
            
                    
                def column_nome_mae(inscricao)
                    
                        inscricao.try(:nome_mae)
                    
                end
            
                    
                def column_rg(inscricao)
                    
                        inscricao.try(:rg)
                    
                end
            
                    
                def column_cpf(inscricao)
                    
                        inscricao.try(:cpf)
                    
                end
            
                    
                def column_orgao_expedidor(inscricao)
                    
                        inscricao.try(:orgao_expedidor)
                    
                end
            
                    
                def column_data_expedicao(inscricao)
                    
                        inscricao.try(:data_expedicao)
                    
                end
            
                    
                def column_celular(inscricao)
                    
                        inscricao.try(:celular)
                    
                end
            
                    
                def column_telefone_residencial(inscricao)
                    
                        inscricao.try(:telefone_residencial)
                    
                end
          
                    
                def column_pagamento_matricula(inscricao)
                    
                        inscricao.try(:pagamento_matricula) ? 'Pago' : 'Não Paga'
                    
                end
            
                    
                    
                def column_created_at(inscricao)
                    
                        inscricao.try(:created_at).try(:to_fs)
                    
                end
            
                    
                def column_updated_at(inscricao)
                    
                        inscricao.try(:updated_at).try(:to_fs)
                    
                end
            
        

        
        def column_opcoes(inscricao)
            opcoes = ""

            opcoes << (link_to(inscricao_path(inscricao),
                    { remote: @remote, class: 'btn btn-icon btn-primary me-2 mb-2', title: 'Visualizar',
                    data: { toggle: 'tooltip', placement: 'top' } }) do
                    content_tag(:i, '', class: 'las la-search')
            end).to_s

            opcoes << (link_to(edit_inscricao_path(inscricao),
                        { remote: @remote, class: 'btn btn-icon btn-warning me-2 mb-2', title: 'Editar',
                        data: { toggle: 'tooltip', placement: 'top' } }) do
                content_tag(:i, '', class: 'las la-edit')
                end).to_s

            opcoes << (button_to inscricao_path(inscricao),
                        method: :delete,
                        data: { confirm: t('helpers.links.confirm_destroy', model: inscricao.model_name.human), toggle: 'tooltip', placement: 'top' },
                        remote: @remote,
                        class: 'btn btn-icon btn-danger me-2 mb-2', title: 'Remover' do
                    content_tag(:i, '', class: 'las la-trash')
                end).to_s

            opcoes.html_safe
        end

        def inscricoes
            @inscricoes ||= fetch
        end

        def query
          if params[:curso_id].present?  
            'Inscricao.joins(:curso).where(curso_id: params[:curso_id])'
          else
            'Inscricao'
          end
        end

        def fetch
            str_query = query
            params[:columns].each do |column|
                str_query << ".where(#{column[1][:data]}: '#{column[1][:search][:value]}')" if column[1][:search][:value].present?
            end
            str_query << '.search(params[:search][:value])' if params[:search][:value].present?
            str_query << %{.order("#{sort_column}" => "#{sort_direction}").page(page).per(per_page)}
            eval str_query
        end

        def total
            str_query = query
            str_query << '.count'
            eval str_query
        end

        def page
            params[:start].to_i / per_page + 1
        end
    
        def per_page
            params[:length].to_i.positive? ? params[:length].to_i : 10
        end
    
        def sort_column
            columns = ["id", "nome", "sexo", "data_nascimento", "cidade", "nome_pai", "nome_mae", "rg", "cpf", "orgao_expedidor", "data_expedicao", "celular", "telefone", "residencial", "forma_pagamento", "secretaria", "data_pagamento", "observacao", "created_at", "updated_at"]
            columns[params[:order]['0'][:column].to_i]
        end

        def sort_direction
            params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
        end


end