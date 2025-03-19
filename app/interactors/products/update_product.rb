module Products
  class UpdateProduct
    include Interactor

    def call
      product = context.product

      if product.update(context.product_params)
        context.product = product
      else
        context.fail!(error: product.errors.full_messages.join(", "))
      end
    end
  end
end
