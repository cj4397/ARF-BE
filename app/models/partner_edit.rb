class PartnerEdit < ApplicationRecord
    validates :name, presence:true
    validates :status, presence:true
    has_many :comment, dependent: :destroy
    has_one :user_detail, dependent: :destroy
    has_one :partner
    belongs_to :edit
end
