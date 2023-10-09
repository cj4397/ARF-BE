class Person < ApplicationRecord
    has_many :partner
    belongs_to :family
    belongs_to :member, optional:true
end
