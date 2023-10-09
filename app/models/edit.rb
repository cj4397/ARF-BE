class Edit < ApplicationRecord
    has_many :comment
    has_one :history
    has_one :user_detail
    belongs_to :clan
end
