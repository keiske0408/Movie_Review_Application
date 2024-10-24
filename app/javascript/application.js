// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
Turbo.session.drive = false;
import * as bootstrap from "bootstrap"
import jQuery from "jquery"
window.jQuery = jQuery
window.$ = jQuery