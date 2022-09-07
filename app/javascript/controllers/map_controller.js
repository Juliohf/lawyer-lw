import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = { apiKey: String, markers: Array }
  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
    container: this.element, // container ID
    style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb', // style URL
    });
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  // #addMarkersToMap() {
  //   const marker = new mapboxgl.Marker()
  //   .setLngLat([30.5, 50.5])
  //   .addTo(this.map);

  // }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
