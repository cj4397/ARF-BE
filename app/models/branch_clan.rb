class BranchClan < ApplicationRecord
   has_and_belongs_to_many :clan
   has_one :clan_detail
end
