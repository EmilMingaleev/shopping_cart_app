RSpec.describe CartProducts::RemoveFromCart, type: :interactor do
  let(:cart_product) { create :cart_product }

  it 'removes a product from the cart' do
    result = described_class.call(cart_product: cart_product)
    expect(result).to be_success
    expect(CartProduct.exists?(cart_product.id)).to be_falsey
  end
end
