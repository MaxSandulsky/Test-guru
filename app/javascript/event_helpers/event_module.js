import {Sorter} from "utilities/sorting"
import {Comparator} from "utilities/password_match"

export const enable_inputCompare_for = (element_class) => {
  const control = document.querySelectorAll(element_class)

  if (control) {
    for (let i = 0; i < control.length; i++) {
      control[i].addEventListener('input', () => {
        const comparing_field = new Comparator
        comparing_field.comparePasswords()
      })
    }
  }
}

export const enable_tableSort_for = (element_class) => {
  const control = document.querySelectorAll(element_class)

  if (control) {
    for (let i = 0; i < control.length; i++) {
      control[i].addEventListener('click', () => {
        const sortingTable = new Sorter(control[i])
        sortingTable.sortRowsbyColumn()
      })
    }
  }
}
