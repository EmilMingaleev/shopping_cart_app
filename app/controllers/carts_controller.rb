class CartsController < ApplicationController
  def show
    @cart = current_cart
    result = Carts::CalculateTotals.call(cart: @cart)

    @total_price = result.total_price
    @total_price_with_discount = result.total_price_with_discount
  end

  def clear
    result = Carts::ClearCart.call(cart: current_cart)

    if result.success?
      redirect_to cart_path, notice: "Корзина очищена"
    else
      redirect_to cart_path, alert: "Ошибка очистки корзины"
    end
  end
end
