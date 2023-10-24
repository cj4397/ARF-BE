class MemoryEdit < ApplicationRecord
    validates :reason, presence: true
    has_one :user_detail, dependent: :destroy
    has_one :history
    has_one :history_edit, dependent: :destroy
    belongs_to :edit


end
