import { Controller } from "@hotwired/stimulus"
import Splide from '@splidejs/splide';

// Connects to data-controller="carousel"
export default class extends Controller {
  static targets = [ "carousel", "thumbnail"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
    console.log(this.carouselTarget)
    var splide = new Splide( this.carouselTarget, {

      perPage: 1,

    });

    splide.mount();

    var thumbnails = document.getElementsByClassName( 'thumbnail' );

    for ( var i = 0; i < thumbnails.length; i++ ) {
      initThumbnail( thumbnails[ i ], i );
    }

    function initThumbnail( thumbnail, index ) {
      thumbnail.addEventListener( 'click', function () {
        splide.go( index );
      } );
    }
  }


}
// TODO: fix carousel so it starts in the center of the screen
