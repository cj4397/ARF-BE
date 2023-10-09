class Memory < ApplicationRecord
    has_one :history
    belongs_to :clan
end
