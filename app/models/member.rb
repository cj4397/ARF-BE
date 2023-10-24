class Member < ApplicationRecord
    
    belongs_to :user
    has_one :user_detail, :through => :user
    belongs_to :clan
    has_one :clan_detail, :through => :clan

    # has_one:user_detail
    
end
