class Child < ApplicationRecord
    has_one :person
    belongs_to :partner
end
