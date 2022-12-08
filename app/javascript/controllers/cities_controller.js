import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

export default class extends Controller {
  static targets = [ "input" ]
  static values = { key: String, placeholder: String }

  connect() {
    this.geocoder = new MapboxGeocoder({
      accessToken: this.keyValue,
      types: "place",
      placeholder: this.placeholderValue
    })
    this.geocoder.addTo(this.element)
    this.geocoder.on("result", event => this.#setInputValue(event))
    this.geocoder.on("clear", () => this.#clearInputValue())
    // console.log(this.geocoder[0])
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
