export class Expandable {
  constructor(element_class) {
    this.element_class = element_class
  }

  hide() {
    document.querySelector(this.element_class).classList.add('hide')
  }

  reveal() {
    document.querySelector(this.element_class).classList.remove('hide')
  }
}
