import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "content" ]

  pushme() {
    console.log(this.contentTarget.value)
  }

  pushit() {
    console.log(this.contentTarget.value)
  }
}