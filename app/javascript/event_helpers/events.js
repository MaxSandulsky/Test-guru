import {enable_inputCompare_for, enable_tableSort_for} from 'event_helpers/event_module'
import "utilities/password_match"

document.addEventListener('turbolinks:load', () => {
  enable_inputCompare_for('.password')
  enable_tableSort_for('.sort-by-title')
})
