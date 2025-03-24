module Products
  class DeleteProduct
    include Interactor

    def call
      product = context.product

      if product.destroy
        context.message = I18n.t("products.delete.success")
      else
        context.fail!(error: I18n.t("products.delete.error"))
      end
    end
  end
end
