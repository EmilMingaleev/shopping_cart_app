RSpec.describe CartProducts::AddToCart, type: :interactor do
  let(:cart) { create :cart }
  let(:product) { create :product }

  context 'successful addition' do
    it 'adds a product to the cart' do
      result = described_class.call(cart: cart, product: product, quantity: 2)
      expect(result).to be_success
      expect(cart.cart_products.count).to eq(1)
      expect(cart.cart_products.first.quantity).to eq(2)
    end
  end

  context 'errors' do
    it 'when cart is not found' do
      result = described_class.call(cart: nil, product: product, quantity: 2)
      expect(result).to be_failure
      expect(result.error).to eq('Cart not found')
    end

    it 'when product is not found' do
      result = described_class.call(cart: cart, product: nil, quantity: 2)
      expect(result).to be_failure
      expect(result.error).to eq('Product not found')
    end

    it 'when quantity is less than 1' do
      result = described_class.call(cart: cart, product: product, quantity: 0)
      expect(result).to be_failure
      expect(result.error).to eq('Quantity must be greater than 0')
    end
  end
end
