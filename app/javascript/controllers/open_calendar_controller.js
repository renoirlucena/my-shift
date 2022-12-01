import { Controller } from "@hotwired/stimulus"
// import bootstrap from 'bootstrap'
import * as bootstrap from "bootstrap"


export default class extends Controller {
  static targets = ["modal", "modalBody"]

  connect() {
    console.log('hey from open calendar')
    console.log(this.modalBodyTarget)
    this.modal = new bootstrap.Modal(this.modalTarget)
  }

  open({params}) {
    const url = `/requests/${params.id}/calendar`

    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.modalBodyTarget.innerHTML = data
        this.modal.show()
      })
  }
}
