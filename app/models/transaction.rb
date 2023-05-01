class Transaction < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :groups
    validates :name, presence: true, uniqueness: true
    validates :amount,
              presence: true,
              format: {
                with: /\A\d+(\.\d{1,2})?\z/,
                message: 'must be a decimal value with up to 2 decimal places'
              },
              numericality: {
                greater_than_or_equal_to: 0
              }
end
