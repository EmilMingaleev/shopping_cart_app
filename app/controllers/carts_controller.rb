class CartsController < ApplicationController
  def show
    @cart = current_cart
    result = Carts::CalculateTotals.call(cart: @cart)

    @total_price = result.total_price
    @total_price_with_discount = result.total_price_with_discount
  end

  def update_discount
    @cart = current_cart
    discount = params[:discount].to_f.clamp(0, 1000)

    if @cart.update(discount: discount)
      redirect_to cart_path, notice: "Скидка обновлена"
    else
      redirect_to cart_path, alert: "Ошибка обновления скидки"
    end
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
