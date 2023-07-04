class CreateGroupEntity < ActiveRecord::Migration[7.0]
  def change
    create_table :group_entities do |t|
      t.belongs_to :group, null: false, foreign_key: 'group_id'
      t.belongs_to :entity, null: false, foreign_key: 'entity_id'

      t.timestamps
    end
  end
end
