import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slider", "value", "orderTotal"];

  connect() {
    this.cartTotal = parseFloat(this.orderTotalTarget.dataset.total);
    this.update();
  }

  update() {
    let discount = parseFloat(this.sliderTarget.value);
    let percentage = (discount / this.sliderTarget.max) * 100;

    this.sliderTarget.style.background = `linear-gradient(to right, #4AD9BD ${percentage}%, #ccc ${percentage}%)`;
    this.valueTarget.textContent = `${discount} ₽`;
    this.orderTotalTarget.textContent = `${Math.max(this.cartTotal - discount, 0)} ₽`;
  }
}
