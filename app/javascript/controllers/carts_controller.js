import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantityInput", "total", "quantity"]

  connect() {
    this.setupQuantityInputs()
  }

  setupQuantityInputs() {
    this.quantityInputTargets.forEach(input => {
      input.addEventListener("input", () => this.updateTotals(input))
    })
  }

  updateTotals(input) {
    const productId = input.dataset.productId
    const quantity = parseInt(input.value) || 1
    const price = JSON.parse(input.dataset.prices)[productId]

    const totalElement = this.totalTargets.find(el => el.id === `total-${productId}`)
    const quantityElement = this.quantityTargets.find(el => el.id === `quantity-${productId}`)

    if (totalElement && quantityElement) {
      totalElement.textContent = `${quantity * price} ₽`
      quantityElement.textContent = quantity
    }
  }
}
