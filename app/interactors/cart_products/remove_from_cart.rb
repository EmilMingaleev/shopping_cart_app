module CartProducts
  class RemoveFromCart
    include Interactor

    def call
      cart_product = context.cart_product

      if cart_product.destroy
        context.message = "Товар успешно удален из корзины."
      else
        context.fail!(error: "Не удалось удалить товар.")
      end
    end
  end
end
