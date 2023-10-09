class ClanRequest < ApplicationRecord
  
    has_one :user_detail, dependent: :destroy

    # validates :details, presence: true
    belongs_to :clan
end
