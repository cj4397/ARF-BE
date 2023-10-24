class Partner < ApplicationRecord
    has_many :children, dependent: :destroy
    belongs_to :person
    belongs_to :partner_edit,optional:true
    belongs_to :partner_delete,optional:true
end
