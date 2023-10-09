class Request < ApplicationRecord
    validates :name, presence: true, uniqueness:true
   
    belongs_to :clan_creation, optional:true
    belongs_to :branch_creation, optional:true

end
