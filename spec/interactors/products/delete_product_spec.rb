RSpec.describe Products::DeleteProduct, type: :interactor do
  let!(:product) { create :product }

  it 'deletes the product' do
    result = described_class.call(product: product)
    expect(result).to be_success
    expect(Product.exists?(product.id)).to be_falsey
  end
end
