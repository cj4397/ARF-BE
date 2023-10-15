class FamilyHistory < ApplicationRecord
    has_one :history
    belongs_to :family
end
