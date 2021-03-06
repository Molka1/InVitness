import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey:String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    console.log

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/aaatl/cl0cff0er000x14rumtrr9lzt"
    });
    this._addMarkersToMap();
    this._fitMapToMarkers();
    // this._on('load', function () {
    //   this.map.resize();
    // });
    };

    _fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 3000, maxZoom: 15, duration: 0
      });
    };

    _addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window)

        // Create a HTML element for your custom marker
        const customMarker = document.createElement("div")
        customMarker.className = "marker"
        customMarker.style.backgroundImage = `url('${marker.image_url}')`
        customMarker.style.backgroundSize = "contain"
        customMarker.style.width = "35px"
        customMarker.style.height = "35px"

        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(customMarker)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
      });
      };



}
