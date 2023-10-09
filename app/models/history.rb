class History < ApplicationRecord
    validates :title, presence:true
    validates :details, presence:true
    belongs_to :clan_history, optional:true
    belongs_to :family_history, optional:true
    belongs_to :memory, optional:true
    belongs_to :edit, optional:true
end
