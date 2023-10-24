class ClanDetailsEdit < ApplicationRecord
     validates :name, presence: true, uniqueness:true
     validates :reason, presence: true
     has_one :clan_detail
     has_many :comment, dependent: :destroy
     has_one :user_detail, dependent: :destroy
     belongs_to :edit
end
