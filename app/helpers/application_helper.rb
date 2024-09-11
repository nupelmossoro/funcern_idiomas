module ApplicationHelper
  def format_rg(rg)
    rg.present? ? rg.gsub(/(\d{2})(\d{3})(\d{3})(\d{1})/, '\1.\2.\3-\4') : ''
  end

  def format_cpf(cpf)
    cpf.present? ? cpf.gsub(/(\d{3})(\d{3})(\d{3})(\d{2})/, '\1.\2.\3-\4') : ''
  end

  def format_celular(celular)
    celular.present? ? celular.gsub(/(\d{2})(\d{5})(\d{4})/, '(\1) \2-\3') : ''
  end

  def format_telefone_residencial(telefone_residencial)
    telefone_residencial.present? ? telefone_residencial.gsub(/(\d{4})(\d{4})/, '\1-\2') : ''
  end

  def format_pagamento_matricula(pagamento_matricula)
    pagamento_matricula ? "Sim" : "Não"
  end

  def format_year_semester(date)
    return unless date

    year = date.strftime("%Y")
    semester = date.month <= 6 ? '1' : '2'
    "#{year}.#{semester}"
  end


  def format_forma_pagamento(forma_pagamento)
    case forma_pagamento
    when 'À vista'
      'À vista'
    when 'Parcelado'
      'Parcelado'
    else
      ''
    end
  end

  def active_header_menu?(controllers)
    controllers.each do |controller|
      next unless controller[0] == params[:controller]
      return 'active' if controller[1] == '*' || controller[1].include?(params[:action])
    end
  end

  def active_collapse_menu?(controllers)
    controllers.each do |controller|
      next unless controller[0] == params[:controller]
      return 'here show' if controller[1] == '*' || controller[1].include?(params[:action])
    end
  end
end
