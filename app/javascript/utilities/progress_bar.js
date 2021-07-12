const tilesCount = 50

export class TileHandler {
  constructor(questionIndex, questionsCount, tiles) {
    this.questionIndex = questionIndex
    this.questionsCount = questionsCount
    this.tiles = tiles
  }

  updateProgressBar() {
    document.querySelectorAll('.progress-bar').forEach(tile => {
      tile.textContent = '☐'
      tile.classList.add('uncompleted')
    })

    const completed = this.questionIndex/this.questionsCount*tilesCount

    for (var i = 0; i < completed; i++) {
      const completedTiles = document.querySelector('.tile-' + i)

      if (completedTiles) {
        completedTiles.classList.remove('uncompleted')
        completedTiles.textContent = '▣'
      }
    }
  }
}
