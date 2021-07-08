export class Comparator {
  comparePasswords() {

    const password = document.getElementById('user_password')
    const confirmation = document.getElementById('user_password_confirmation')

    if (password.value == '' || confirmation.value == '') {
    } else if (password.value == confirmation.value) {
      document.querySelector('.octicon-check').classList.remove('hide')
      document.querySelector('.octicon-x').classList.add('hide')
      password.classList.add('correct')
      confirmation.classList.add('correct')
      password.classList.remove('incorrect')
      confirmation.classList.remove('incorrect')
    } else {
      document.querySelector('.octicon-check').classList.add('hide')
      document.querySelector('.octicon-x').classList.remove('hide')
      password.classList.remove('correct')
      confirmation.classList.remove('correct')
      password.classList.add('incorrect')
      confirmation.classList.add('incorrect')
    }
  }
}
