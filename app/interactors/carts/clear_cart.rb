module Carts
  class ClearCart
    include Interactor

    def call
      cart = context.cart
      cart.cart_products.destroy_all
    end
  end
end
