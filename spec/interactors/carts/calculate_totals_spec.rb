RSpec.describe Carts::CalculateTotals, type: :interactor do
  let(:cart) { Cart.create discount: 10 }
  let(:product) { Product.create name: "Product", price: 100 }

  before do
    CartProduct.create(cart: cart, product: product, quantity: 2)
  end

  it "correctly calculates the cart total" do
    result = described_class.call(cart: cart)

    expect(result.total_price).to eq(200)
    expect(result.total_price_with_discount).to eq(190)
  end
end
