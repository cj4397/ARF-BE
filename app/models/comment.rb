class Comment < ApplicationRecord
    # validates :member, presence: true
    has_one :user_detail, dependent: :destroy
    belongs_to :clan_details_edit, optional:true
    belongs_to :history_edit, optional:true
    belongs_to :family_edit, optional:true
    belongs_to :partner_edit, optional:true
    belongs_to :clan_history_delete, optional:true
    belongs_to :family_history_delete, optional:true
    belongs_to :memory_delete, optional:true
    belongs_to :family_delete, optional:true
    belongs_to :partner_delete, optional:true
end
