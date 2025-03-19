class ProductsController < ApplicationController
  def create
    result = Products::CreateProduct.call(product_params: product_params)

    if result.success?
      redirect_to products_path, notice: "Товар создан"
    else
      redirect_to new_product_path, alert: result.error
    end
  end

  def update
    product = Product.find(params[:id])
    result = Products::UpdateProduct.call(product: product, product_params: product_params)

    if result.success?
      redirect_to products_path, notice: "Товар обновлен"
    else
      redirect_to edit_product_path(product), alert: result.error
    end
  end

  def destroy
    product = Product.find(params[:id])
    result = Products::DeleteProduct.call(product: product)

    if result.success?
      redirect_to products_path, notice: result.message
    else
      redirect_to products_path, alert: result.error
    end
  end

  private

  def product_params
    params.expect(produc: [ :name, :price, :image ])
  end
end
