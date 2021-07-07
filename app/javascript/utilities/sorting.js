export class Sorter {
  constructor(table_element) {
    this.table_element = table_element
    this.column_index = this.column_index(table_element)
  }

  sortRowsbyColumn() {
    const table = document.querySelector('table')

    const rows = table.querySelectorAll('tr')
    let sortedRows = []

    for (let i = 1; i < rows.length; i++) {
      sortedRows.push([rows[i].querySelectorAll('td')[this.column_index].textContent, rows[i]])
    }

    if (this.table_element.querySelector('.octicon-arrow-up').classList.contains('hide')) {
      sortedRows.sort(this.compareRowsAsc)
      this.table_element.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.table_element.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.table_element.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.table_element.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    let sortedTable = document.createElement('table')

    sortedTable.classList.add('table')
    sortedTable.appendChild(rows[0])

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTable.appendChild(sortedRows[i][1])
    }

    table.parentNode.replaceChild(sortedTable, table)
  }

  compareRowsAsc(row1, row2) {
    const testTitle1 = row1[0]
    const testTitle2 = row2[0]

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

  compareRowsDesc(row1, row2) {
    const testTitle1 = row1[0]
    const testTitle2 = row2[0]

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }

  column_index(obj) {
    let heads = Array.from(obj.parentNode.childNodes)
    let column_index = 0
    for (let i = 0; i < heads.length; i++) {
      if (heads[i].textContent.trim() != '') {
        heads[column_index] = heads[i].textContent.trim()
        column_index++
      }
    }
    heads = heads.slice(0, column_index)

    for (let i = 0; i < heads.length; i++) {
      if (heads[i] == obj.textContent.trim()) { column_index = i }
    }

    return column_index
  }
}
