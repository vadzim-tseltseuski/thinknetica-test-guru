// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("@popperjs/core")
require('util/sorting')
require('util/password_confirm_validate')
require('util/form_inline')
require('jquery')
require("util/progress_bar")


import "bootstrap"

// Import the specific modules you may need (Modal, Alert, etc)
import { Tooltip, Popover } from "bootstrap"
import Sorting from 'util/sorting'
import PaswordConfirmValidate from 'util/password_confirm_validate'

// The stylesheet location we created earlier
require("../../assets/stylesheets/application.scss")

// If you're using Turbolinks. Otherwise simply use: jQuery(function () {
document.addEventListener("turbolinks:load", () => {
    // Both of these are from the Bootstrap 5 docs
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
        return new Tooltip(tooltipTriggerEl)
    })

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function(popoverTriggerEl) {
        return new Popover(popoverTriggerEl)
    })

    const table = document.querySelector('table')
    if (table) { new Sorting(table, '.sort-by-title').addListener() }

    const form = document.getElementById('new_user')
    let passwordConfirmationInput = null
    let passwordInput = null
    if (form) {
      passwordConfirmationInput = form.querySelector('#user_password_confirmation')
      passwordInput = form.querySelector('#user_password')
    }
    if (passwordInput && passwordConfirmationInput) { new PaswordConfirmValidate(form).addListener() }
})
