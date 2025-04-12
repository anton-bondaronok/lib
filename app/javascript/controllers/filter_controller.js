import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["advanced", "toggleText", "iconDown", "iconUp", "tag", "tagField"]

  toggle() {
    this.advancedTarget.classList.toggle("hidden")
    this.toggleTextTarget.textContent =
      this.advancedTarget.classList.contains("hidden") ? "Больше фильтров" : "Меньше фильтров"

    this.iconDownTarget.classList.toggle("hidden")
    this.iconUpTarget.classList.toggle("hidden")
  }

  submit() {
    this.element.requestSubmit()
  }

  toggleTag(event) {
    this.tagTargets.forEach(element => {
      element.classList.remove("bg-indigo-600", "text-white")
      element.classList.add("bg-indigo-100", "text-indigo-700", "hover:bg-indigo-200")
    })

    event.target.classList.remove("bg-indigo-100", "text-indigo-700", "hover:bg-indigo-200")
    event.target.classList.add("bg-indigo-600", "text-white")
    this.tagFieldTarget.value = event.target.dataset.tagId
    this.submit()
  }
}
