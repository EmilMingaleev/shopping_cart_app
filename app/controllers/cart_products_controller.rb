class CartProductsController < ApplicationController
    def update
    cart_product = CartProduct.find(params[:id])
    result = CartProducts::UpdateCartProductQuantity.call(cart_product: cart_product, new_quantity: params[:quantity])

    if result.success?
      redirect_to cart_path, notice: "Количество обновлено"
    else
      redirect_to cart_path, alert: result.error
    end
    end

  def destroy
    cart_product = CartProduct.find(params[:id])
    result = CartProducts::RemoveFromCart.call(cart_product: cart_product)

    if result.success?
      redirect_to cart_path, notice: result.message
    else
      redirect_to cart_path, alert: result.error
    end
  end
end
