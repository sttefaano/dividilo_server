class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end