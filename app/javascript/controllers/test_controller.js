import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["name"]

  output() {
    const time = new Date(this.element.value)
    console.log(time)
    const myElement = document.getElementById("_input_start_time_4i")
    for (let i = 0; i < myElement.children.length; i++) {
      console.log(myElement.children[i].value);
    }
    //console.log(time.getDay())
    //console.log(this.nameTarget.value)
  }
}
