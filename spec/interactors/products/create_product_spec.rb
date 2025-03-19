RSpec.describe Products::CreateProduct, type: :interactor do
  subject(:context) { described_class.call(product_params: product_params) }

  context "with errors" do
    let(:product_params) { { name: "", price: -10 } }

    it "does not create a product" do
      expect(context).to be_failure
      expect(context.error).to be_present
      expect(Product.count).to eq(0)
    end
  end
end
