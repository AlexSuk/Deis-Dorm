// function map(){
//   console.log("here");
//   if(!Gmaps){
//     console.log("no gmaps");
//     setTimeout(function(){console.log(map)},1000);
//     return;
//   }else{
//     console.log("we got gmaps");
//   }

var json_array = [
  { lat: 42.364018, lng: -71.260718, name: 'Ridgewood', infowindow: "Here is Ridgewood Quad." },
  { lat: 42.369610, lng: -71.255711, name: 'North', infowindow: "Here is North Quad." },
  { lat: 42.367565, lng: -71.255646, name: 'Castle', infowindow: "Here is a beautiful Castle." }
];
var places_of_interest = [
  {lat: 42.366327, lng: -71.258744, name: "Dunkin' Donuts", infowindow: "food info and shop info"},
  {lat: 42.368043, lng: -71.256617, name: "Usdan Dinning Hall", infowindow: "Lower Usdan Dinning hall"},
  {lat: 42.367854, lng: -71.258671, name: "Starbucks", infowindow: "Starbucks in Farber Library"},
  {lat: 42.365730, lng: -71.260188, name: "Einstein Bros Bagels",infowindow: "Selling bagels and softdrinks here"},
  {lat: 42.366412, lng: -71.260546, name: "Sherman Dinning Hall", infowindow: "Student dinning hall"}
];
// console.log("second");
// var json_array = building_markers
var initialized = false;
var Gmaps;
var handler = Gmaps.build('Google');
var markers = [];
var interest_markers = [];
var map = handler.buildMap({ internal: {id: 'map'} }, function(){
  markers = handler.addMarkers([
    {
      "lat": 42.366719,
      "lng": -71.258604,
      "picture": {
        "url" : "/assets/brandeis_logo.png",
        "width":  32,
        "height": 32
      },
      "infowindow": "Here is Brandeis"
    }
  ]);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
  handler.getMap().setZoom(16); //control zoom level (0-21)
  if(!initialized) createSidebar(json_array);

});

if(navigator.geolocation)
    navigator.geolocation.getCurrentPosition(displayOnMap);

function createSidebar(json_array){
  initialized = true;
  _.each(json_array, function(json){
    var $li = $("<div class='pointer'>" + json.name + "</div>");
    $li.appendTo('#sidebar_container');
    $li.on('click', function(){
      create(json);
    })
  });
};



function find(marker){
  // move to marker
  marker.setMap(handler.getMap()); //because clusterer removes map property from marker

  marker.panTo();
  google.maps.event.trigger(marker.getServiceObject(), 'click');
}

function create(obj){
  // create marker
  destroyAll();
  var marker=handler.addMarker(obj);
  marker.setMap(map);
  find(marker);
  markers.push(marker);
  return marker;
}

function destroyAll(){
  for(var i=0;i<markers.length;i++){
    destroy(markers[i]);
  }
  markers=[];
}

function destroy(marker){
  marker.setMap(null);
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
// }

// create an array to store all markers of places_of_interest
function create_interest_marker(places) {
  for (var i = 0; i< places.length; i ++){
    var marker = handler.addMarker(places[i]);
    // interest_markers.push(marker);
  }
}

// == shows all markers of places_of_interest and ensures the checkbox is checked ==
function show(places_of_interest) {
  interest_markers = create_interest_marker(places_of_interest);

  // var regEx = new RegExp("[" + places_of_interest + "]")
  // for (var i=0; i < interest_markers.length; i++) {
  //   if (Gmaps.map.markers[i].cat) {
  //     if (Gmaps.map.markers[i].cat.match(regEx)) {
  //       Gmaps.map.showMarker(Gmaps.map.markers[i]);
  //     }
  //   }
  // }
  // == check the checkbox ==
  // document.getElementById(places_of_interest+"box").checked = true;
}

// == hides all markers of  places_of_interest, and ensures the checkbox is cleared ==
function hide(places_of_interest) {
  destroyAll();
  // var regEx = new RegExp("[" + places_of_interest + "]")
  // for (var i=0; i < Gmaps.map.markers.length; i++) {
  //   if (Gmaps.map.markers[i].cat) {
  //     if (Gmaps.map.markers[i].cat.match(regEx)) {
  //       Gmaps.map.hideMarker(Gmaps.map.markers[i]);
  //     }
  //   }
  // }
  // == clear the checkbox ==
  // document.getElementById(places_of_interest+"box").checked = false;
  // == close the info window, in case its open on a marker that we just hid
  // Gmaps.map.infowindow.close();
}

// == a checkbox has been clicked ==
function boxclick(box) {
  if (box.checked) {
    show(places_of_interest);
  } else {
    hide(places_of_interest);
  }
}
