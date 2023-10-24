class ClanHistoryDelete < ApplicationRecord
    validates :reason, presence:true
    has_one :clan_history
    has_many :comment, dependent: :destroy
    has_one :user_detail, dependent: :destroy
    belongs_to :delete_collection
end
