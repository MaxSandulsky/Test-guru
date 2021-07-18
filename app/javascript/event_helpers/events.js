import {enable_inputCompare_for,
        enable_tableSort_for,
        enable_formInline_for,
        enable_progressBar_for,
        enable_retractable_for,
        enable_images_for} from 'event_helpers/event_module'
import "utilities/password_match"

document.addEventListener('turbolinks:load', () => {
  enable_inputCompare_for('.password')
  enable_tableSort_for('.sort-by-title')
  enable_formInline_for('.form-inline-link')
  enable_progressBar_for('.progress-bar')
  enable_retractable_for('.user', '.menu')
  enable_images_for('.badge')
})
