class UserDetail < ApplicationRecord
    validates :name, presence:true

    belongs_to :user
    belongs_to :clan_creation, optional:true
    belongs_to :branch_creation,optional:true
    belongs_to :clan_request,optional:true
    belongs_to :edit,optional:true
    belongs_to :comment,optional:true
end
