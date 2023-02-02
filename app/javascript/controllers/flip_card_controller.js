import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flip-card"
export default class extends Controller {
  static targets = [ 'front', 'back' ]

  flip() {
    this.frontTarget.classList.toggle("hidden")
    this.backTarget.classList.toggle("hidden")
  }
}
