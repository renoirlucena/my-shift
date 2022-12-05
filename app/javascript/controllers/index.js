// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FlatpickrController from "./flatpickr_controller"
application.register("flatpickr", FlatpickrController)

import FlatpickrSearchController from "./flatpickr_search_controller"
application.register("flatpickr-search", FlatpickrSearchController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalTurboController from "./modal_turbo_controller"
application.register("modal-turbo", ModalTurboController)

import OpenCalendarController from "./open_calendar_controller"
application.register("open-calendar", OpenCalendarController)

import TypedJsController from "./typed_js_controller"
application.register("typed-js", TypedJsController)

import CitiesController from "./cities_controller"
application.register("cities", CitiesController)
