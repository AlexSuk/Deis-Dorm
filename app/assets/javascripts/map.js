var json_array = gon.buildings;
var places_of_interest = [
  {lat: 42.363196, lng: -71.260464, name: "Dunkin' Donuts", infowindow: "food info and shop info"},
  {lat: 42.367854, lng: -71.258671, name: "Starbucks", infowindow: "Starbucks in Farber Library"},
  {lat: 42.365730, lng: -71.260188, name: "Einstein Bros Bagels",infowindow: "Selling bagels and softdrinks here"},
  {lat: 42.368043, lng: -71.256617, name: "Usdan Dinning Hall", infowindow: "Lower Usdan Dinning hall"},
  {lat: 42.366412, lng: -71.260546, name: "Sherman Dinning Hall", infowindow: "Student dinning hall"}
];
var markers = [];
var brandeis_logo = 'https://s3.amazonaws.com/deis-dorms-devel/pictures/static/map_icons/brandeis_logo.png';
var starbucks = 'https://s3.amazonaws.com/deis-dorms-devel/pictures/static/map_icons/s_logo.png';
var donut = 'https://s3.amazonaws.com/deis-dorms-devel/pictures/static/map_icons/d_logo.png';
var einstein = 'https://s3.amazonaws.com/deis-dorms-devel/pictures/static/map_icons/e_logo.png';
var map;
var geojsonData;
$.ajax({
	url:"/geodata",
	success:function(data,status,jqXHR){
		geojsonData=data;
	}
});

function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 42.366719, lng: -71.258604,},
    zoom: 16,
    icon: brandeis_logo
  });
  createSidebar(json_array);

  map.data.addGeoJson(geojsonData);

  map.data.setStyle(function(feature) {
    var color = feature.getProperty('color');
    return /** @type {google.maps.Data.StyleOptions} */({
      fillColor: color,
      strokeColor: color,
      strokeWeight: 2
    });
  });

  map.data.addListener('mouseover', function(event) {
    map.data.revertStyle();
    map.data.overrideStyle(event.feature, {strokeWeight: 5});
  });

  map.data.addListener('mouseout', function(event) {
    map.data.revertStyle();
  });

  map.data.addListener('click', function(event){
    var bldg;
    var bldgName = event.feature.getProperty('name');
    //find the corresponding building information array
    for (var i = 0; i < json_array.length; i++) {
      var name = json_array[i]["name"];
      if (bldgName === name ){
        bldg = json_array[i];
      }
    }
    var infowindow = createInfowindow(bldg);
    infowindow.setPosition(event.latLng);
    infowindow.open(map);
  })
}

function createInfowindow(place_hash){
  var contentString = '<h4>'+place_hash["name"]+'</h4>'+
                      '<p>'+place_hash["infowindow"]+'<IMG BORDER="0" ALIGN="Left" SRC="https://s3.amazonaws.com/deis-dorms-devel/pictures/static/buildings/'+place_hash["id"]+'.jpg" SIZE="175x131" height="131" width="175">'+'</p>'+
                      '<a href="/quads/'+place_hash["quad_id"]+'/buildings/'+place_hash["id"]+'"'+' type="button" class="btn btn-primary">Learn More</a>'
  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });
  return infowindow;
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

var ifKeep = null;
function createForSideBar(obj){
  controlMarkers(markers, ifKeep);
  if (ifKeep == null){
    markers = [];
  }
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

//create a single marker and its infowindow
function create(hash){
  var infowindow = createInfowindow(hash);
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
    var latlng = {lat: places[i]["lat"], lng: places[i]["lng"]};
    //change marker icons
    var icon_image = brandeis_logo;
    if (places[i]["name"] === "Starbucks"){
      icon_image = starbucks;
    } else if (places[i]["name"] === "Einstein Bros Bagels"){
      icon_image = einstein;
    } else if (places[i]["name"] === "Dunkin' Donuts"){
      icon_image = donut;
    }
    var marker = new google.maps.Marker({
      position: latlng,
      map: map,
      icon: icon_image
    });
    //add infowindow functionality
    // var infowindow = createInfowindow(places[i]);
    // marker.addListener('click', function() {
    //   infowindow.open(map, marker);
    // });
    interest_markers.push(marker);
  }
  firstTime = false;
}

// shows all markers of places_of_interest
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
// hides all markers of  places_of_interest
function hide(places_of_interest) {
  controlMarkers(interest_markers, null);
}

// check if the "Keep Markers" checkbox is checked
function keepMarkers(box){
  if (box.checked){
    ifKeep = map;
  } else {
    ifKeep = null;
    controlMarkers(markers, ifKeep);
    markers = [];
  }
}

// == a checkbox has been clicked ==
function interestMarkersBox(box) {
  if (box.checked) {
    show(places_of_interest);
  } else {
    hide(places_of_interest);
  }
}
