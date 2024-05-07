import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="specialization-toggle"
export default class extends Controller {
  static targets = ["toggableElement"]

  connect() {
    console.log("Hello from toggle_controller.js")
    console.log("this.toggableElementTarget = ", this.toggableElementTarget);
    // this.toggle();
    // console.log("this.doctorCheckboxTarget.checked = ", this.doctorCheckboxTarget.checked);
    // this.toggle();
  }

  toggle(event) {
    console.log("vrei sa faci toggle?");
    this.toggableElementTarget.classList.remove("hidden");
  }
}
