export default class PaswordConfirmValidate{

  constructor(form) {
    this.form = form
  }

  addListener(){
    if (this.form) { this.form.addEventListener('input', event=> {this.passwordMatches()}) }
  }

  passwordMatches(){
    const passwordConfirmationInput = this.form.querySelector('#user_password_confirmation')
    const passwordInput = this.form.querySelector('#user_password')
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
}
