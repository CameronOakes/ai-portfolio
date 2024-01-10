import { Controller } from "@hotwired/stimulus"
import Splide from '@splidejs/splide';

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = [ "carousel" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
    console.log(this.carouselTarget)
    new Splide( this.carouselTarget, {
      type: 'loop',
      perPage: 1, // Change perPage to 1 to show full image
      perMove: 1,
      gap: '1rem',
      drag: 'free',
      pagination: false,
      fixedWidth: '100%', // Set the width of the image
      center: true, // Center the image
      breakpoints: {
        640: {
          perPage: 1,
        },
        768: {
          perPage: 1,
        },
        1024: {
          perPage: 1,
        },
      }
    }).mount();
  }
}
// TODO: fix carousel so it starts in the center of the screen
