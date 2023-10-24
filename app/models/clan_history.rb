class ClanHistory < ApplicationRecord
    has_one :history, dependent: :destroy
    belongs_to :clan
    belongs_to :clan_history_delete, optional:true
end
