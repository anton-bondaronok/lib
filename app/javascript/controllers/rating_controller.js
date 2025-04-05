import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["star", "stars"]

  submit() {
    this.element.requestSubmit()
  }

  highlight(event) {
    const hoverValue = parseInt(event.currentTarget.dataset.value)
    this.starTargets.forEach((el) => {
      const val = parseInt(el.dataset.value)
      el.querySelector("span").classList.toggle("text-yellow-400", val <= hoverValue)
    })
  }

  reset() {
    const checked = this.element.querySelector("input[type='radio']:checked")
    const currentValue = checked ? parseInt(checked.value) : 0
    this.starTargets.forEach((el) => {
      const val = parseInt(el.dataset.value)
      el.querySelector("span").classList.toggle("text-yellow-400", val <= currentValue)
    })
  }


  select(event) {
    const value = parseInt(event.currentTarget.dataset.value)
    const input = this.element.querySelector(`#star-${value}`)
    if (input) {
      input.checked = true
      this.submit()
    }
  }
}
