module Products
  class DeleteProduct
    include Interactor

    def call
      product = context.product

      if product.destroy
        context.message = "Продукт удален."
      else
        context.fail!(error: "Ошибка удаления продукта.")
      end
    end
  end
end
