class InscricoesDatatable
    delegate :params, :h, :t, :link_to, :button_to, :content_tag,
        :inscricao_path,
        :recibo_inscricao_path,
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


                            'data_nascimento' => format_data(inscricao.data_nascimento),


                            'nome_pai' => column_nome_pai(inscricao),


                            'nome_mae' => column_nome_mae(inscricao),


                            'rg' => column_rg(inscricao),


                            'cpf' => format_cpf(inscricao.cpf),


                            'orgao_expedidor' => column_orgao_expedidor(inscricao),


                            'data_expedicao' => column_data_expedicao(inscricao),


                            'celular' => format_celular(inscricao.celular),


                            'telefone_residencial' => column_telefone_residencial(inscricao),



                            'created_at' => column_created_at(inscricao),


                            'updated_at' => column_updated_at(inscricao),


                            'curso_id' => column_curso_id(inscricao),


                            'pagamento_matricula' => format_pagamento_matricula(inscricao.pagamento_matricula),


                            'cidade' => column_cidade(inscricao),


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



                def column_created_at(inscricao)

                        inscricao.try(:created_at).try(:to_fs)

                end


                def column_updated_at(inscricao)

                        inscricao.try(:updated_at).try(:to_fs)

                end


                def column_curso_id(inscricao)

                        inscricao.try(:curso_id)

                end


                def column_pagamento_matricula(inscricao)

                        inscricao.try(:pagamento_matricula)

                end


                def column_cidade(inscricao)

                        inscricao.try(:cidade)

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


            opcoes << (link_to(recibo_inscricao_path(inscricao, format: :pdf),
                    { target: "_blank", class: 'btn btn-icon btn-info me-2 mb-2', title: 'Recibo',
                    data: { toggle: 'tooltip', placement: 'top' } }) do
            content_tag(:i, '', class: ' las la-dollar-sign')
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
            'Inscricao'
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
            columns = ["id", "nome", "sexo", "data_nascimento", "nome_pai", "nome_mae", "rg", "cpf", "orgao_expedidor", "data_expedicao", "celular", "telefone_residencial", "created_at", "updated_at", "curso_id", "pagamento_matricula", "cidade"]
            columns[params[:order]['0'][:column].to_i]
        end

        def sort_direction
            params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
        end

  # Métodos auxiliares para formatação
  def format_cpf(cpf)
    cpf.present? ? cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4') : ''
  end

  def format_celular(celular)
    celular.present? ? celular.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3') : ''
  end

  def format_data(data)
    data.present? ? data.strftime('%d/%m/%Y') : ''
  end

  def format_pagamento_matricula(pagamento_matricula)
    pagamento_matricula ? 'Sim' : 'Não'
  end
end
