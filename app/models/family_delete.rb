class FamilyDelete < ApplicationRecord
    validates :reason, presence:true
    has_one :family
    has_many :comment, dependent: :destroy
    has_one :user_detail, dependent: :destroy
    belongs_to :delete_collection
end
