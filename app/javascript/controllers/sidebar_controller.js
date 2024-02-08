import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [ "sidebar" ]

  connect() {
    console.log("Hello, Stimulus! from sidebar", this.element)
    window.addEventListener("scroll", this.scrollHandler.bind(this));
  }

  disconnect() {
    window.removeEventListener("scroll", this.scrollHandler.bind(this));
  }

  scrollHandler() {
    const scrollPosition = window.scrollY;
    const sidebar = this.sidebarTarget;

    if (scrollPosition > 50) {
      sidebar.classList.add("animate");
    } else {
      sidebar.classList.remove("animate");
    }
  }
}
