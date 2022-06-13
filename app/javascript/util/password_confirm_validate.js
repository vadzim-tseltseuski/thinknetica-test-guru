document.addEventListener('turbolinks:load', function() {
  const passwordInput = document.getElementById('user_password')
  const passwordConfirmationInput = document.getElementById('user_password_confirmation')

  if (passwordInput && passwordConfirmationInput) {
      passwordInput.addEventListener('input', passwordMatches)
      passwordConfirmationInput.addEventListener('input', passwordMatches)
  }
  })

  function passwordMatches(){
    const passwordConfirmationInput = document.getElementById('user_password_confirmation')
    const passwordInput = document.getElementById('user_password')
    const password = passwordInput.value
    const passwordConfirmation = passwordConfirmationInput.value


    if (passwordConfirmation === '') {
      passwordConfirmationInput.classList.remove("error", "success");
    return
    }
    if (password === passwordConfirmation){
      passwordConfirmationInput.className ='success'

    } else {
      passwordConfirmationInput.className ='error'
    }
  }
