RSpec.describe Cart, type: :model do
  it { should have_many(:cart_products).dependent(:destroy) }
  it { should have_many(:products).through(:cart_products) }

  it { should validate_numericality_of(:discount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1000) }
end
