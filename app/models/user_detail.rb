class UserDetail < ApplicationRecord
    validates :name, presence:true

    belongs_to :user
    belongs_to :clan_creation, optional:true
    belongs_to :branch_creation,optional:true
    belongs_to :clan_request,optional:true

    belongs_to :clan_history_edit,optional:true
    belongs_to :family_history_edit,optional:true
    belongs_to :memory_edit,optional:true
    belongs_to :family_edit,optional:true
    belongs_to :partner_edit,optional:true
    belongs_to :clan_details_edit,optional:true

    belongs_to :family_delete,optional:true
    belongs_to :partner_delete,optional:true
    belongs_to :clan_history_delete,optional:true
    belongs_to :family_history_delete,optional:true
    belongs_to :memory,optional:true

    belongs_to :comment,optional:true
end
