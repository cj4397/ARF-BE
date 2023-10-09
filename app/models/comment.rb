class Comment < ApplicationRecord
    # validates :member, presence: true
    has_one :user_detail
    belongs_to :edit
end
