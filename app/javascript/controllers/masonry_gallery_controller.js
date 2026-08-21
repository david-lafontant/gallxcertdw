import { Controller } from '@hotwired/stimulus'

// Connects to data-controller="masonry-gallery"
export default class extends Controller {
  connect() {
    var elem = document.querySelector('.grid')
    var msnry = new Masonry(elem, {
      // options
      itemSelector: '.grid-item',
      columnWidth: 200,
    })
  }
}
