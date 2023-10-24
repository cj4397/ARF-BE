class Memory < ApplicationRecord
    has_one :history, dependent: :destroy
    belongs_to :clan
    belongs_to :memory_delete, optional:true
end
