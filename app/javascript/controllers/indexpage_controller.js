import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="indexpage"
export default class extends Controller {
  static targets = ["list", "map"]
  connect() {
  }

  showMap() {
      this.listTarget.classList.add("d-none")
      this.mapTarget.classList.remove("d-none")
  }

  showList() {
      this.mapTarget.classList.add("d-none")
      this.listTarget.classList.remove("d-none")
  }
}
