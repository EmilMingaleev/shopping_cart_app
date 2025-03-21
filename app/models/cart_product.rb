class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  # Метод для расчета общей стоимости товара в корзине
  def total_price
    quantity * product.price
  end
end
