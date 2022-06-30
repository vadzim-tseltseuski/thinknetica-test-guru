document.addEventListener('turbolinks:load', function() {
    $('.form-inline-link').on('click', formInlineHandler)

    const errors = document.querySelector('.resource-errors')

    if (errors && document.querySelector('.tests-index')) {
      const resourceId = errors.dataset.resourceId
      tdInlineHandler(resourceId)
    }
  })

function formInlineHandler(event) {
  event.preventDefault()

  const testId = this.dataset.testId
  tdInlineHandler(testId)
}

function tdInlineHandler(testId) {
    const data = `[data-test-id="${testId}"]`
    const link = document.querySelector('.form-inline-link' + data)

    const $testTitle = $('.test-title' + data)
    const $formInline = $('.form-inline' + data)
    $testTitle.toggle()
    $formInline.toggle()

  if ($formInline.is(':visible')) {
    link.textContent = 'Cancel'
  } else {
    link.textContent = 'Edit'
  }
}
