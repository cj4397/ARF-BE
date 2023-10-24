class Child < ApplicationRecord
    has_one :family, dependent: :destroy
    belongs_to :partner
end
