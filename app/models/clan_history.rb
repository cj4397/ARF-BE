class ClanHistory < ApplicationRecord
    has_one :history, dependent: :destroy
    belongs_to :clan
end
