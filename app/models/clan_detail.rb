class ClanDetail < ApplicationRecord
    validates :name, presence: true, uniqueness:true
    
    belongs_to :clan
    belongs_to :clan_details_edit, optional:true
    has_many :branch_clan, :through => :clan
end
