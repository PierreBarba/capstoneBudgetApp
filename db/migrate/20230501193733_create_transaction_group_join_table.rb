class CreateTransactionGroupJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions_groups, id: false do |t|
      t.belongs_to :transaction
      t.belongs_to :group
    end
  end
end