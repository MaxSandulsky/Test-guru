export class Sorter {
  constructor(table_element) {
    this.table_element = table_element
    this.column_index = this.column_index(table_element)
  }

  sortRowsbyColumn() {
    const table = document.querySelector('table')

    let sortedRows = Array.from(table.rows).slice(1)

    sortedRows.forEach((row, i) => {
      sortedRows[i] = Array.from([row.querySelectorAll('td')[this.column_index].textContent, row])
    })

    if (this.table_element.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort((rowA, rowB) => rowA[0] > rowB[0] ? 1 : -1)
      this.table_element.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.table_element.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort((rowA, rowB) => rowB[0] > rowA[0] ? 1 : -1)
      this.table_element.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.table_element.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    let sortedTable = document.createElement('table')
    sortedTable.classList.add('table')
    sortedTable.appendChild(table.querySelector('tr'))

    sortedRows.forEach(row => {
      sortedTable.appendChild(row[1])
    })

    table.parentNode.replaceChild(sortedTable, table)
  }

  column_index(obj) {
    let heads = Array.from(obj.parentNode.childNodes)
    let column_index = 0

    heads.forEach(td => {
      if (td.textContent.trim() != '') {
        heads[column_index] = td.textContent.trim()
        column_index++
      }
    })

    heads = heads.slice(0, column_index)

    column_index = heads.indexOf(obj.textContent.trim())

    return column_index
  }
}
