class CreateEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.belongs_to :user, null: false, foreign_key: "user_id"

      t.timestamps
    end
  end
end
