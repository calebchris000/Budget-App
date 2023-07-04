class Entity < ApplicationRecord
  has_many :group_entities
  has_many :groups, through: :group_entities, foreign_key: :entity_id
  belongs_to :user
end
