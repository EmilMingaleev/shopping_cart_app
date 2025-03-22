import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["slider", "orderTotal", "value"];

  connect() {
    this.cartTotal = parseFloat(this.orderTotalTarget.dataset.total);

    let savedDiscount = localStorage.getItem("discount") || 0;
    this.sliderTarget.value = savedDiscount;

    this.update();
  }

  update() {
    let discount = parseFloat(this.sliderTarget.value);
    let percentage = (discount / this.sliderTarget.max) * 100;

    localStorage.setItem("discount", discount);

    this.sliderTarget.style.background = `linear-gradient(to right, #4AD9BD ${percentage}%, #ccc ${percentage}%)`;
    this.valueTarget.textContent = `${discount} ₽`;

    let newTotal = Math.max(this.cartTotal - discount, 0);
    this.orderTotalTarget.textContent = `${newTotal} ₽`;
  }
}
