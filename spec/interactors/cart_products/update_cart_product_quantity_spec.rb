RSpec.describe CartProducts::UpdateCartProductQuantity, type: :interactor do
  let(:cart_product) { create :cart_product, quantity: 2 }

  it 'updates product quantity' do
    result = described_class.call(cart_product: cart_product, new_quantity: 5)
    expect(result).to be_success
    expect(cart_product.reload.quantity).to eq(5)
  end

  it 'removes product when quantity is 0' do
    result = described_class.call(cart_product: cart_product, new_quantity: 0)
    expect(result).to be_success
    expect(CartProduct.exists?(cart_product.id)).to be_falsey
  end
end
