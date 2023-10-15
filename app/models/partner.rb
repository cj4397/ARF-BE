class Partner < ApplicationRecord
    has_many :children
    belongs_to :person
end
