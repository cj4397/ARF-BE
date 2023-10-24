class Person < ApplicationRecord

    has_many :partner, dependent: :destroy
    belongs_to :family
    belongs_to :member, optional:true
    belongs_to :child, optional:true
end
