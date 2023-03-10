import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar"]

  updateNavbar() {
    if (window.scrollY >= 200) {
      this.element.classList.add("navbar-model-white")
    } else {
      this.element.classList.remove("navbar-model-white")
    }
  }
}
