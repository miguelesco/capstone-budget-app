class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :entities, dependent: :destroy
  has_many :groups, dependent: :destroy
end
