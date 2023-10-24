class DeleteCollection < ApplicationRecord
    has_many :family_delete
    has_many :partner_delete
    has_many :clan_history_delete
    has_many :family_history_delete
    has_many :memory_delete
    belongs_to :clan
end
