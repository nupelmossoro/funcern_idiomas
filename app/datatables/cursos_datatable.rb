class CursosDatatable
    delegate :params, :h, :t, :link_to, :button_to, :content_tag, 
        :curso_path, 
        :edit_curso_path, to: :@view
  
    
    def initialize(view)
        @view = view
        @remote = params[:remote] == 'true'
    end

    def as_json(_options = {})
        {
            draw: params[:draw].to_i,
            recordsTotal: total,
            recordsFiltered: cursos.total_count,
            data: data
        }
    end

    private 
        def data
            cursos.each_with_index.map do |curso, index|
                {
                    'index' => (index + 1) + ((page - 1) * per_page),
                                            
                                            
                            'idioma' => column_idioma(curso),
                        
                                            
                            'nivel' => column_nivel(curso),
                        
                                            
                            'dia' => column_dia(curso),
                        
                                            
                            'turno' => column_turno(curso),
                        
                                            
                            'created_at' => column_created_at(curso),
                        
                                            
                            'updated_at' => column_updated_at(curso),
                        
                                            
                                            
                            'valor_cents' => column_valor_cents(curso),
                        
                                            
                            'valor_currency' => column_valor_currency(curso),
                        
                                            
                            'professor' => column_professor(curso),
                        
                                            
                            'dias' => column_dias(curso),
                        
                    
                    'opcoes' => column_opcoes(curso)
                }
            end
        end


                    
                    
                def column_idioma(curso)
                    
                        curso.try(:idioma)
                    
                end
            
                    
                def column_nivel(curso)
                    
                        curso.try(:nivel)
                    
                end
            
                    
                def column_dia(curso)
                    
                        curso.try(:dia)
                    
                end
            
                    
                def column_turno(curso)
                    
                        curso.try(:turno)
                    
                end
            
                    
                def column_created_at(curso)
                    
                        curso.try(:created_at).try(:to_fs)
                    
                end
            
                    
                def column_updated_at(curso)
                    
                        curso.try(:updated_at).try(:to_fs)
                    
                end
            
                    
                    
                def column_valor_cents(curso)
                    
                        curso.try(:valor_cents)
                    
                end
            
                    
                def column_valor_currency(curso)
                    
                        curso.try(:valor_currency)
                    
                end
            
                    
                def column_professor(curso)
                    
                        curso.try(:professor)
                    
                end
            
                    
                def column_dias(curso)
                    
                        curso.try(:dias)
                    
                end
            
        

        
        def column_opcoes(curso)
            opcoes = ""

            opcoes << (link_to(curso_path(curso),
                    { remote: @remote, class: 'btn btn-icon btn-primary me-2 mb-2', title: 'Visualizar',
                    data: { toggle: 'tooltip', placement: 'top' } }) do
                    content_tag(:i, '', class: 'las la-search')
            end).to_s

            opcoes << (link_to(edit_curso_path(curso),
                        { remote: @remote, class: 'btn btn-icon btn-warning me-2 mb-2', title: 'Editar',
                        data: { toggle: 'tooltip', placement: 'top' } }) do
                content_tag(:i, '', class: 'las la-edit')
                end).to_s

            opcoes << (button_to curso_path(curso),
                        method: :delete,
                        data: { confirm: t('helpers.links.confirm_destroy', model: curso.model_name.human), toggle: 'tooltip', placement: 'top' },
                        remote: @remote,
                        class: 'btn btn-icon btn-danger me-2 mb-2', title: 'Remover' do
                    content_tag(:i, '', class: 'las la-trash')
                end).to_s

            opcoes.html_safe
        end

        def cursos
            @cursos ||= fetch
        end

        def query
            'Curso'
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
            columns = ["id", "idioma", "nivel", "dia", "turno", "created_at", "updated_at", "valor_cents", "valor_currency", "professor", "dias"]
            columns[params[:order]['0'][:column].to_i]
        end

        def sort_direction
            params[:order]['0'][:dir] == 'desc' ? 'desc' : 'asc'
        end


end