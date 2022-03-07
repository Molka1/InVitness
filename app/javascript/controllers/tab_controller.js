import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "link" ]

  connect() {
    console.log('Hello, Stimulus!');
  }

  activate() {
    this.linkTarget.classList.add("active-tab")
  }
}
