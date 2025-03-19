class Cart < ApplicationRecord
  has_many :cart_products, dependent: :destroy
  has_many :products, through: :cart_products

  validates :discount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1000 }

  def total_price
    total = cart_products.sum { |cp| cp.product.price * cp.quantity }
    [ total - discount, 0 ].max
  end
end
