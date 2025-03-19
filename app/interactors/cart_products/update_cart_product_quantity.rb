module CartProducts
 class UpdateCartProductQuantity
    include Interactor

    def call
      cart_product = context.cart_product
      new_quantity = context.new_quantity

      if new_quantity.to_i > 0
        cart_product.update(quantity: new_quantity)
      else
        cart_product.destroy
      end
    rescue StandardError => e
      context.fail!(error: e.message)
    end
 end
end
