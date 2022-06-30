export default class Sorting {
  constructor(table, selector_th) {
    this.selector_th = selector_th
    this.table = table
    if (this.table) { this.control = this.table.querySelector(selector_th) }
  }

  addListener(){
    if (this.control) { this.control.addEventListener('click', event=> {this.sortRowsByTitle()}) }
  }

  sortRowsByTitle() {
    const tableBody = this.table.querySelector('tbody')
    const rows = tableBody.querySelectorAll('tr')
    const sortedRows = []

    for (let i = 0; i < rows.length; i++) {
      sortedRows.push(rows[i])
    }

    if (this.control.querySelector('.octicon-arrow-up').classList.contains('hide')){
      sortedRows.sort(this.compareRowsAsc)
      this.control.querySelector('.octicon-arrow-up').classList.remove('hide')
      this.control.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
      sortedRows.sort(this.compareRowsDesc)
      this.control.querySelector('.octicon-arrow-down').classList.remove('hide')
      this.control.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    const sortedTableBody = document.createElement('tbody')

    for (let i = 0; i < sortedRows.length; i++) {
      sortedTableBody.appendChild(sortedRows[i])
    }

    tableBody.parentNode.replaceChild(sortedTableBody, tableBody)
  }

  compareRowsAsc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
  }

  compareRowsDesc(row1, row2) {
    const testTitle1 = row1.querySelector('td').textContent
    const testTitle2 = row2.querySelector('td').textContent

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
  }
}
