export class Expandable {
  constructor(element) {
    this.element = element
  }

  hide() {
    if (this.element) {
      this.element.classList.add('hide')
    }
  }

  reveal() {
    if (this.element) {
      this.element.classList.remove('hide')
    }
  }
}
