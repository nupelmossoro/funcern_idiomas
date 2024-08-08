class Curso < ApplicationRecord

    # extends ...................................................................

    # includes ..................................................................
    audited
    acts_as_paranoid

    include Searchrable

    # security (i.e. attr_accessible) ...........................................

    monetize :valor_cents

    # relationships .............................................................
    has_many :inscricoes
    #enums
    enum dias: {
    segunda: "Segunda-Feira",
    terca: "Terça-Feira",
    quarta: "Quarta-Feira",
    quinta: "Quinta-Feira",
    sexta: "Sexta-Feira",
    sabado: "Sábado",
    domingo: "Domingo"
    }

    enum turno: {
    manha: "Manhã",
    tarde: "Tarde",
    noite: "Noite"
    }
    # validations ...............................................................
    # callbacks .................................................................
    # scopes ....................................................................
    # additional config .........................................................
    # class methods .............................................................
    # public instance methods ...................................................

    def text
      "#{idioma} Nivel:#{nivel} Turno: #{turno}"
    end
    # protected instance methods ................................................
    # private instance methods ..................................................
end
