class CreateGroup < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.belongs_to :user, null: false, foreign_key: "user_id"
      t.timestamps
    end
  end
end
