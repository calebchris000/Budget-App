class Group < ApplicationRecord
  has_many :group_entities
  has_many :entities, through: :group_entities, foreign_key: :group_id
  belongs_to :user
end
