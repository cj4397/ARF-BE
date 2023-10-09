class ClanDetail < ApplicationRecord
    validates :name, presence: true, uniqueness:true
    belongs_to :clan
end
