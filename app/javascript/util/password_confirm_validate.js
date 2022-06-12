document.addEventListener('turbolinks:load', function() {
    passwordConfirmation = document.getElementById('user_password_confirmation')

    if (passwordConfirmation) { passwordConfirmation.addEventListener("input", passwordMatches) }
  })

  function passwordMatches(){
    var password = user_password.value
    var passwordConfirmation = user_password_confirmation.value

    if (passwordConfirmation === '') {
     this.classList.remove("error", "success");
    return
    }
    if (password === passwordConfirmation){
      this.className ='success'

    } else {
      this.className ='error'
    }
  }
