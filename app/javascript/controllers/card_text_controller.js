import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-text"
export default class extends Controller {
  static targets = [ "card" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  enable() {
    this.cardTarget.classList.remove("text-remove")
    console.log("Enable")
  }

  disable() {
    this.cardTarget.classList.add("text-remove")
    console.log("Disable")
  }
}
