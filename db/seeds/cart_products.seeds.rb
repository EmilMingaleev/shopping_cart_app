after "images" do
  puts "Adding Products to Cart"

  cart = Cart.first
  products = Product.all

  products.each do |product|
    CartProduct.find_or_create_by!(cart: cart, product: product) do |cart_product|
      cart_product.quantity = 1
    end
  end

  puts "Cart products seeded!"
end
