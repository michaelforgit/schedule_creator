import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["name", "hideable", "hide_button", "hide_icon"]
  
  output() {
    const time = new Date(this.element.value)
    console.log(time)
    const myElement = document.getElementById("_input_start_time_4i")
    for (let i = 0; i < myElement.children.length; i++) {
      console.log(myElement.children[i].value);
    }
  }
  visibility() {
    console.log("HELLO")
    this.hideableTargets.forEach((el) => {
      el.hidden = !el.hidden
    });
    if (this.hide_iconTarget.classList.contains("fa-minus")) {
      this.hide_buttonTarget.classList.add("btn-success")
      this.hide_iconTarget.classList.add("fa-expand")
      this.hide_iconTarget.classList.remove("fa-minus")
      this.hide_buttonTarget.classList.remove("btn-danger")
    } else {
      this.hide_buttonTarget.classList.add("btn-danger")
      this.hide_iconTarget.classList.add("fa-minus")
      this.hide_iconTarget.classList.remove("fa-expand")
      this.hide_buttonTarget.classList.remove("btn-success")
    }
  }
}
