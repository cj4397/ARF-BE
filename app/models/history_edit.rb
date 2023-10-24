class HistoryEdit < ApplicationRecord
 
    has_many :comment, dependent: :destroy
    belongs_to :family_history_edit, optional:true
    belongs_to :clan_history_edit, optional:true
    belongs_to :memory_edit, optional:true
end
