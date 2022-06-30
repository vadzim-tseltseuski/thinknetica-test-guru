document.addEventListener('turbolinks:load', function() {
    const bar = document.querySelector('.progress-bar')
    if (bar) {
        let current_number = bar.dataset.currentNumber
        let total = bar.dataset.total
        let progress = (current_number / total) * 100
        bar.setAttribute("style", `width: ${progress}%`)
        bar.innerHTML = progress.toPrecision(4) + '%'
      }
    })
