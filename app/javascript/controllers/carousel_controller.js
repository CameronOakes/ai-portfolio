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
      perPage: 1,
      perMove: 1,
      gap: '5rem',
      drag: 'free',
      pagination: true,
      heightRatio: 0.5, // Set the height ratio to 0.5 for half the screen height
      autoWidth: true, // Set autoWidth to true to make the slides have the same width
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
