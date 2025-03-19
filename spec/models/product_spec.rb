RSpec.describe Product, type: :model do
  it { should have_many(:cart_products).dependent(:destroy) }
end
