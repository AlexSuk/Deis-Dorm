var json_array = [
  { lat: 42.364018, lng: -71.260718, name: 'Ridgewood', infowindow: "Here is Ridgewood Quad." },
  { lat: 42.369610, lng: -71.255711, name: 'North', infowindow: "Here is North Quad." },
  { lat: 42.367565, lng: -71.255646, name: 'Castle', infowindow: "Here is a beautiful Castle." }
];
var places_of_interest = [
  {lat: 42.366327, lng: -71.258744, name: "Dunkin' Donuts", infowindow: "food info and shop info"},
  {lat: 42.367854, lng: -71.258671, name: "Starbucks", infowindow: "Starbucks in Farber Library"},
  {lat: 42.365730, lng: -71.260188, name: "Einstein Bros Bagels",infowindow: "Selling bagels and softdrinks here"},
  {lat: 42.368043, lng: -71.256617, name: "Usdan Dinning Hall", infowindow: "Lower Usdan Dinning hall"},
  {lat: 42.366412, lng: -71.260546, name: "Sherman Dinning Hall", infowindow: "Student dinning hall"}
];
var markers = [];
var brandeis_logo = '/assets/brandeis_logo.png';
var map;
var test = {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        // "letter": "G",
        "color": "blue",
        // "rank": "7",
        // "ascii": "71"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [-71.260632, 42.364164],
            [-71.260732, 42.364025],
            [-71.260328, 42.363883],
            [-71.260309, 42.364038],
            [-71.260632, 42.364164]
          ]
        ]
      }
    }
    // {
    //   "type": "Feature",
    //   "properties": {
    //     "letter": "e",
    //     "color": "red",
    //     "rank": "5",
    //     "ascii": "101"
    //   },
    //   "geometry": {
    //     "type": "Polygon",
    //     "coordinates": [
    //       [
    //         [144.14, -27.41], [145.67, -27.52], [146.86, -27.09], [146.82, -25.64], [146.25, -25.04],
    //         [145.45, -24.68], [144.66, -24.60], [144.09, -24.76], [143.43, -25.08], [142.99, -25.40],
    //         [142.64, -26.03], [142.64, -27.05], [142.64, -28.26], [143.30, -29.11], [144.18, -29.57],
    //         [145.41, -29.64], [146.46, -29.19], [146.64, -28.72], [146.82, -28.14], [144.84, -28.42],
    //         [144.31, -28.26], [144.14, -27.41]
    //       ],
    //       [
    //         [144.18, -26.39], [144.53, -26.58], [145.19, -26.62], [145.72, -26.35], [145.81, -25.91],
    //         [145.41, -25.68], [144.97, -25.68], [144.49, -25.64], [144, -25.99], [144.18, -26.39]
    //       ]
    //     ]
    //   }
    // }
  ]
}

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 42.366719, lng: -71.258604,},
    zoom: 16,
    icon: brandeis_logo
  });
  createSidebar(json_array);

  // map.data.loadGeoJson('/app/assets/javascript/google.json');
  map.data.addGeoJson(test);

  // Load GeoJSON.
  // map.data.loadGeoJson('https://storage.googleapis.com/maps-devrel/google.json');
  //
  // Color each letter gray. Change the color when the isColorful property
  // is set to true.
  map.data.setStyle(function(feature) {
    var color = 'blue';
    return /** @type {google.maps.Data.StyleOptions} */({
      fillColor: color,
      strokeColor: color,
      strokeWeight: 2
    });
  });


  // When the user hovers, tempt them to click by outlining the letters.
  // Call revertStyle() to remove all overrides. This will use the style rules
  // defined in the function passed to setStyle()
  map.data.addListener('mouseover', function(event) {
    map.data.revertStyle();
    map.data.overrideStyle(event.feature, {strokeWeight: 8});
  });

  map.data.addListener('mouseout', function(event) {
    map.data.revertStyle();
  });
}

function createSidebar(json_array){
  initialized = true;
  _.each(json_array, function(json){
    var $li = $("<div class='pointer'>" + json.name + "</div>");
    $li.appendTo('#sidebar_container');
    $li.on('click', function(){
      createForSideBar(json);
    })
  });
};

function createForSideBar(obj){
  controlMarkers(markers, null);
  markers = [];
  var marker = create(obj);
  marker.setMap(map);
  map.panTo({lat: obj["lat"], lng: obj["lng"]});
  markers.push(marker);
}

function controlMarkers(markerArray, map){
  for (var i = 0; i < markerArray.length; i++) {
    markerArray[i].setMap(map);
  }
}

function create(hash){
  var infowindow = new google.maps.InfoWindow({
    content: hash["infowindow"]
  });
  var latlng = {lat: hash["lat"], lng: hash["lng"]};
  var marker = new google.maps.Marker({
    position: latlng,
    animation: google.maps.Animation.DROP,
    map: map
  });
  marker.addListener('click', function() {
    infowindow.open(map, marker);
  });
  return marker;
}

// search functionality
var kids;
$("#search").on("input",function(ev){
  kids=$("#sidebar_container div");
  var query=$("#search").val().toLowerCase();
  for(var i=0;i<kids.length;i++){
    var match=(kids[i].textContent.toLowerCase().indexOf(query)!=-1);
    kids[i].style.display=match?"block":"none";
  }
});

$("body > #sidebar_container").remove();// clean up after Google

var interest_markers = [];
var firstTime = true;
// create an array to store all markers of places_of_interest
function create_interest_marker(places) {
  for (var i = 0; i< places.length; i ++){
    var infowindow = new google.maps.InfoWindow({
      content: places[i]["infowindow"]
    });
    var latlng = {lat: places[i]["lat"], lng: places[i]["lng"]};
    // var icon_image = s;
    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: brandeis_logo
    });
    marker.addListener('click', function() {
      infowindow.open(map, marker);
    });
    interest_markers.push(marker);
  }
  firstTime = false;
}

// == shows all markers of places_of_interest and ensures the checkbox is checked ==
function show(places_of_interest) {
  if (firstTime){
    create_interest_marker(places_of_interest);
  }
  controlMarkers(interest_markers, map);
  for (var i = 0; i < interest_markers.length; i ++){
    var marker = interest_markers[i];
    marker.setAnimation(google.maps.Animation.BOUNCE);
    stopAnimation(marker);
  }
  map.panTo({lat: 42.366719, lng: -71.258604,});
}

function stopAnimation(marker) {
    setTimeout(function () {
        marker.setAnimation(null);
    }, 1420);
}
// == hides all markers of  places_of_interest, and ensures the checkbox is cleared ==
function hide(places_of_interest) {
  controlMarkers(interest_markers, null);
}

// == a checkbox has been clicked ==
function boxclick(box) {
  if (box.checked) {
    show(places_of_interest);
  } else {
    hide(places_of_interest);
  }
}
