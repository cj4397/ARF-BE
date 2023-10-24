class FamilyHistory < ApplicationRecord
    has_one :history, dependent: :destroy
    belongs_to :family
    belongs_to :family_history_delete, optional:true
end
