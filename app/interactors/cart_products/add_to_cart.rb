module CartProducts
  class AddToCart
    include Interactor

    def call
      cart = context.cart
      product = context.product
      quantity = context.quantity

      return context.fail!(error: I18n.t("cart_products.add_to_cart.errors.cart_not_found")) unless cart
      return context.fail!(error: I18n.t("cart_products.add_to_cart.errors.product_not_found")) unless product
      return context.fail!(error: I18n.t("cart_products.add_to_cart.errors.invalid_quantity")) if quantity.nil? || quantity <= 0

      cart_product = CartProduct.find_or_initialize_by(cart_id: cart.id, product_id: product.id)
      cart_product.quantity = (cart_product.quantity || 0) + quantity

      if cart_product.save
        context.cart_product = cart_product
      else
        context.fail!(error: I18n.t("cart_products.add_to_cart.errors.save_failed", error: cart_product.errors.full_messages.join(", ")))
      end
    end
  end
end
