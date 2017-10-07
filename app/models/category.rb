class Category < ApplicationRecord
  validates :name, presence: true

  has_many :bicycles, dependent: :destroy
end
