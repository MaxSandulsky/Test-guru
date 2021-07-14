import {Sorter} from "utilities/sorting"
import {Comparator} from "utilities/password_match"
import {InlineEditor} from "utilities/form_inline"
import {TileHandler} from "utilities/progress_bar"
import {Expandable} from "utilities/menu"
import {Badge} from "background_helpers/badge"

export const enable_inputCompare_for = (element_class) => {
  const comparable = document.querySelectorAll(element_class)

  if (comparable) {
    comparable.forEach(element => {
      element.addEventListener('input', () => {
        Comparator.comparePasswords()
      })
    })
  }
}

export const enable_tableSort_for = (element_class) => {
  const sortable = document.querySelectorAll(element_class)

  if (sortable) {
    sortable.forEach(element => {
      element.addEventListener('click', () => {
        const sortingTable = new Sorter(event.target)
        sortingTable.sortRowsbyColumn()
      })
    })
  }
}

export const enable_formInline_for = (element_class) => {
  const inLineEditable = document.querySelectorAll(element_class)

  inLineEditable.forEach(element => {
    if (element != undefined) {
      element.addEventListener('click', (event) => {
        event.preventDefault()

        InlineEditor.formInlineLinkHandler(event.target.dataset.testId)
      })

      const errors = document.querySelector('.resource-errors')

      if (errors) {
        InlineEditor.formInlineLinkHandler(errors.dataset.resourceId)
      }
    }
  })
}

export const enable_progressBar_for = (element_class) => {
  const progressBarTiles = document.querySelectorAll(element_class)

  if (progressBarTiles) {
    const formWithProgress = document.getElementsByName('commit')
    formWithProgress.forEach(element => {
      const tileHandler = new TileHandler(element.dataset.questionIndex,
                                          element.dataset.questionsCount,
                                          progressBarTiles)
      tileHandler.updateProgressBar()

      element.addEventListener('click', (event) => {
        tileHandler.updateProgressBar()
      })
    })
  }
}

export const enable_retractable_for = (activator_class, element_class) => {
  const retractable = document.querySelectorAll(activator_class)

  if (retractable) {
    retractable.forEach(activator => {
      const expandable = new Expandable(element_class)

      activator.addEventListener('mouseover', () => {
        expandable.reveal()
      })

      activator.addEventListener('mouseout', () => {
        expandable.hide()
      })
    })
  }
}

export const enable_images_for = (element_class) => {
  Badge.set_background_images(document.querySelectorAll(element_class))
}
