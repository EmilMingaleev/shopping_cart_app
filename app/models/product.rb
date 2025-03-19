class Product < ApplicationRecord
  has_one_attached :image
  has_many :cart_products, dependent: :destroy

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
