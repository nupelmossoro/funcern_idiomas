class Inscricao < ApplicationRecord

    # extends ...................................................................
    # includes ..................................................................
    audited
    acts_as_paranoid

    include Searchrable

    # security (i.e. attr_accessible) ...........................................
    enum sexo: { Masculino: "masculino", Feminino: "feminino" }
    #enum
    ORGAO_EXPEDITOR = [:AC, :AL, :AP, :AM, :BA, :CE, :DF, :ES, :GO, :MA, :MT, :MS, :MG, :PA, :PB, :PR, :PE, :PI, :RJ, :RN, :RS, :RO, :RR, :SC, :SP, :SE, :TO]
    # relationships .............................................................
    belongs_to :curso
    # validations ...............................................................
    # callbacks .................................................................
    # scopes ....................................................................
    # additional config .........................................................
    # class methods .............................................................
    # public instance methods ...................................................
    # protected instance methods ................................................
    # private instance methods ..................................................
end
