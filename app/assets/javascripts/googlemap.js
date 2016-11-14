var initialize;

initialize = function() {
  var handler;
  handler = Gmaps.build("Google");
  handler.buildMap({
    provider: {
      //maxZoom: 15,
      minZoom: 10
    },
    internal: {
      id: "map"
    }
  }, function() {
    var markers;
    markers = handler.addMarkers([
      {
        lat: 40.7127837,
        lng: -74.0059413,
        infowindow: "holla"
      }
    ]);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
  });
};
initialize();
