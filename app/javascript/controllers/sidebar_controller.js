import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sidebar"
export default class extends Controller {
  static targets = [ "sidebar", "openSidebarButton", "closeSidebarButton" ]

  connect() {
    console.log("Hello, Stimulus! from sidebar", this.element)
    window.addEventListener("scroll", this.scrollHandler.bind(this));
    const sidebar = this.sidebarTarget;
    sidebar.style.display = 'none';
    const openSidebarButton = this.openSidebarButtonTarget;
    const closeSidebarButton = this.closeSidebarButtonTarget;


    openSidebarButton.addEventListener('click', () => {
      sidebar.style.display = 'block';
      openSidebarButton.style.display = 'none';
    });

    closeSidebarButton.addEventListener('click', () => {
      sidebar.style.display = 'none';
      openSidebarButton.style.display = 'block';
    });
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
