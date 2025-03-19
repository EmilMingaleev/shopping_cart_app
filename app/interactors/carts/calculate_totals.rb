module Carts
  class CalculateTotals
    include Interactor

    def call
      cart = context.cart

      total_price = cart.cart_products.includes(:product).sum { |cp| cp.product.price * cp.quantity }
      total_price_with_discount = [ total_price - cart.discount.to_f, 0 ].max

      context.total_price = total_price
      context.total_price_with_discount = total_price_with_discount
    end
  end
end
