RSpec.describe Products::UpdateProduct, type: :interactor do
  let(:product) { create :product, name: "Old Name", price: 100 }

  context "successful product update" do
    let(:updated_params) { { name: "New Name", price: 150 } }

    it "updates the product with new parameters" do
      result = described_class.call(product: product, product_params: updated_params)

      expect(result).to be_success
      expect(result.product.name).to eq("New Name")
      expect(result.product.price).to eq(150)
    end
  end

  context "failed product update" do
    let(:invalid_params) { { name: "", price: -50 } }

    it "does not update the product with invalid parameters" do
      result = described_class.call(product: product, product_params: invalid_params)

      expect(result).to be_failure
      expect(result.error).to be_present
      expect(product.reload.name).to eq("Old Name")
    end
  end
end
