// app/javascript/controllers/flatpickr_controller.js
import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
              enableTime: true,
              dateFormat: "j-M-Y H:i",
              minDate: "today",
              altInput: true,
              altFormat: "j \\de M, Y H:i",
              time_24hr: true,
              allowInput: true,
              plugins: [new rangePlugin({ input: "#request_end_time"})],
              defaultDate: [this.startTimeTarget.value, this.endTimeTarget.value]
            })
    flatpickr(this.endTimeTarget, {allowInput: true, defaultDate: new Date(this.endTimeTarget.value)})
  }
}

// new Date(this.endTimeTarget.value)
