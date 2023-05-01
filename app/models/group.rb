class Group < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :transactions
    # has_one_attached :icon
    validates :name, presence: true, uniqueness: { scope: :user_id, message: 'has already been taken for this user' }
    validates :icon, presence: true, format: { with: /.+\.png\z/, message: "must end with '.png'" }
end
