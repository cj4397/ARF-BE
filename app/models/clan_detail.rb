class ClanDetail < ApplicationRecord
    validates :name, presence: true, uniqueness:true
    
    belongs_to :clan
    belongs_to :clan_details_edit, optional:true
    belongs_to :branch_clan, optional:true
end
