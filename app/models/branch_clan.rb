class BranchClan < ApplicationRecord
   has_and_belongs_to_many :clan, dependent: :destroy
end
