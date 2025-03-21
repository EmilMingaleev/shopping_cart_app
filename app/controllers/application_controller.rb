class ApplicationController < ActionController::Base
  helper_method :current_cart

  def current_cart
    @current_cart ||= Cart.first_or_create(discount: 0)
  end
end
