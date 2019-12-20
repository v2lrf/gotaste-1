// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { fas } from '@fortawesome/free-solid-svg-icons'

import ahoy from 'ahoy.js'
import LocalTime from 'local-time'

import '../css/application.css'

require('@rails/ujs').start()
require('turbolinks').start()
require('@rails/activestorage').start()

// Font Awespome
// Kicks off the process of finding <i> tags and replacing with <svg>
library.add(fas)
dom.watch()

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

require('trix')
require('@rails/actiontext')

ahoy.trackAll()

LocalTime.start()
// Support component names relative to this directory:
var componentRequireContext = require.context("components", true);
var ReactRailsUJS = require("react_ujs");
ReactRailsUJS.useContext(componentRequireContext);
