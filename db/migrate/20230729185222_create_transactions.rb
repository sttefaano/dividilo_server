class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :amount, null: false
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end