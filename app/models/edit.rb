class Edit < ApplicationRecord
    has_many :family_history_edit
    has_many :clan_history_edit
    has_many :memory_edit
    has_many :clan_details_edit
    has_many :family_edit
    has_many :partner_edit

    belongs_to :clan
end
