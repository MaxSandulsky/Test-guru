import {Sorter} from "utilities/sorting"
import {Comparator} from "utilities/password_match"
import {InlineEditor} from "utilities/form_inline"
import {TileHandler} from "utilities/progress_bar"

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

  if (inLineEditable) {
    inLineEditable.forEach(element => {
      element.addEventListener('click', (event) => {
        event.preventDefault()

        InlineEditor.formInlineLinkHandler(event.target.dataset.testId)
      })
    })
  }

  const errors = document.querySelector('.resource-errors')

  if (errors) {
    InlineEditor.formInlineLinkHandler(errors.dataset.resourceId)
  }
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
