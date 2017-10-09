class Bicycle < ApplicationRecord
  include Filterable

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  has_many :suggestions, dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_one :image, as: :imageable, dependent: :destroy

  accepts_nested_attributes_for :image, allow_destroy: true

  scope :category, ->(category_id) { where(category_id: category_id) }
  scope :search, ->(search) {
    where('LOWER(name) LIKE LOWER(?) OR LOWER(description) LIKE LOWER(?)',
          "%#{search}%", "%#{search}%")
  }
end
