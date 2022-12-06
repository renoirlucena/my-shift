import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static targets = [ "input" ]
  static values = { key: String }

  connect() {
    console.log(this.element)
    this.geocoder = new MapboxGeocoder({
      accessToken: this.keyValue,
      types: "place"
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
  }

  #setInputValue(event) {
    console.log(event.result["text"])
    this.inputTarget.value = event.result["text"]
  }

  #clearInputValue() {
    this.inputTarget.value = ""
  }

  disconnect() {
    this.geocoder.onRemove()
  }

  // changePlaceholders() {
  //   // this.tais = document.querySelectorAll(".mapboxgl-ctrl-geocoder--input")
  //   console.log(this.originTarget)
  // }

}
