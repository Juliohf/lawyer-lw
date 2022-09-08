import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="homepage"
export default class extends Controller {
  static targets = ["aiten", "biten", "citen", "diten", "eiten"]
  connect() {
    console.log(this.eitenTarget)
  }


  showSearch() {
      this.aitenTarget.classList.add("d-none")
      this.bitenTarget.classList.add("d-none")
      this.citenTarget.classList.add("d-none")
      this.ditenTarget.classList.add("d-none")
      this.eitenTarget.classList.remove("d-none")
  }
}
