module Products
  class CreateProduct
    include Interactor

    def call
      product = Product.new(context.product_params)

      if product.save
        context.product = product
      else
        context.fail!(error: product.errors.full_messages.join(", "))
      end
    end
  end
end
