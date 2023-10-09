class ClanCreation < ApplicationRecord
    has_one :request, dependent: :destroy
    has_one :user_detail, dependent: :destroy


end
