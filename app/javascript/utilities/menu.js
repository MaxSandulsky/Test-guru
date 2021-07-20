export class Expandable {
  constructor(element_class) {
    this.element_class = element_class
  }

  hide() {
    const element = document.querySelector(this.element_class)
    if (element) {
      element.classList.add('hide')
    }
  }

  reveal() {
    const element = document.querySelector(this.element_class)
    if (element) {
      element.classList.remove('hide')
    }
  }
}
