class Family < ApplicationRecord
    has_many :family
    has_many :family_history
    belongs_to :clan
end
