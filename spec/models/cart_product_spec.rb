RSpec.describe CartProduct, type: :model do
  it { should belong_to(:cart) }
  it { should belong_to(:product) }
end
