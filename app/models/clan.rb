class Clan < ApplicationRecord
    has_one :clan_detail, dependent: :destroy
    has_many :clan_history, dependent: :destroy
    has_many :member, dependent: :destroy
 
    
    has_many :family, dependent: :destroy
    has_many :branch_clan, dependent: :destroy
    has_one :edit, dependent: :destroy
    has_one :delete_collection, dependent: :destroy
    has_many :memory, dependent: :destroy
    has_many :clan_request, dependent: :destroy

   
end
