


class Estado < ApplicationRecord

    # extends ...................................................................
    
    # includes ..................................................................
    audited
    acts_as_paranoid

    include Searchrable

    # security (i.e. attr_accessible) ...........................................
        
        
    # relationships .............................................................
    
    # validations ...............................................................
    # callbacks .................................................................
    # scopes ....................................................................
    # additional config .........................................................
    # class methods .............................................................
    # public instance methods ...................................................
    # protected instance methods ................................................
    # private instance methods ..................................................
end
    