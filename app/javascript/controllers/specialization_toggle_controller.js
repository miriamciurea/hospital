import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="specialization-toggle"
export default class extends Controller {
  connect() {
    console.log("Hello from toggle_controller.js")
  }
}
