class Family < ApplicationRecord

    
    has_many :family_history

    has_one :person

    has_many :partner, :through => :person
    has_many :children,:through => :partner

    belongs_to :clan

end
