class Entity < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :group_entities, dependent: :destroy
  has_many :groups, through: :group_entities, dependent: :destroy
end
