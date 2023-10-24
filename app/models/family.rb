class Family < ApplicationRecord

    
    has_many :family_history, dependent: :destroy

    has_one :person, dependent: :destroy

    has_many :partner, :through => :person
    has_many :children,:through => :partner

    belongs_to :clan
    belongs_to :family_delete, optional:true
    belongs_to :family_edit, optional:true

    # def delete
    #     self.family_delete_id == nil
    # end

end
