var index //помогите исправить пожалуйста

document.addEventListener('turbolinks:load', function() {
  var control = document.querySelectorAll('.sort-by-title')

  if (control) {
    for (var i = 0; i < control.length; i++) {
      control[i].addEventListener('click', sortRowsbyColumn)
    }
  }
})

function sortRowsbyColumn() {
  index = column_index(this)

  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows except the first one which is the header
  for (var i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  var sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelectorAll('td')[index].textContent
  var testTitle2 = row2.querySelectorAll('td')[index].textContent

  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelectorAll('td')[index].textContent
  var testTitle2 = row2.querySelectorAll('td')[index].textContent

  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}

function column_index(obj) {
  var heads = Array.from(obj.parentNode.childNodes)
  var index = 0
  for (var i = 0; i < heads.length; i++) {
    if (heads[i].textContent.trim() != '') {
      heads[index] = heads[i].textContent.trim()
      index++
    }
  }
  heads = heads.slice(0, index)

  for (var i = 0; i < heads.length; i++) {
    if (heads[i] == obj.textContent.trim()) { index = i }
  }

  return index
}
