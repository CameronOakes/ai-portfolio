import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="card-text"
export default class extends Controller {
  static targets = [ "card" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
    this.element.classList.remove("card-gradient")
  }

  enable() {
    this.cardTarget.classList.remove("text-remove")
    this.element.classList.add("card-gradient")
  }

  disable() {
    this.cardTarget.classList.add("text-remove")
    this.element.classList.remove("card-gradient")
  }

  toggle() {
    if (this.cardTarget.classList.contains("card-gradient")) {
      this.element.classList.remove("card-gradient")
    } else {
      this.element.classList.add("card-gradient")
    }
  }
}
