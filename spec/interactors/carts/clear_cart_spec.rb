RSpec.describe Carts::ClearCart, type: :interactor do
  let(:cart) { create :cart }
  let!(:cart_product) { create :cart_product, cart: cart }

  it 'clears the cart' do
    result = described_class.call(cart: cart)
    expect(result).to be_success
    expect(cart.cart_products.count).to eq(0)
  end
end
