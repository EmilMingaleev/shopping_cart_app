module CartProducts
  class RemoveFromCart
    include Interactor

    def call
      cart_product = context.cart_product

      if cart_product.destroy
        context.message = I18n.t("cart_products.remove_from_cart.success")
      else
        context.fail!(error: I18n.t("cart_products.remove_from_cart.error"))
      end
    end
  end
end
