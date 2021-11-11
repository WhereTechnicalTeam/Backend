// @TODO refactor
// TODO make filters work together

var result=[]
// function data(){
//   $.get('/queryjson', function(querydata){
//     queryjson = querydata
//     result = JSON.parse(JSON.stringify(queryjson))
// })
//   return result
// }



  $.get('/queryjson', function(querydata){
    queryjson = querydata
    for (var i = 0; i < queryjson.length; i++){
        result.push(queryjson);
    }
  })


json = result
console.log(json)
var jsonStringify = JSON.stringify(json)
var jsonParse = JSON.parse(jsonStringify); 

var markers = [];
var markerCluster;
var filterSelect = jQuery('.filter');

var filters;

//creation de la map
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 6,
      center: new google.maps.LatLng(7.90690446737339,-1.2044806461391333)
    });

    for (var i = 0; i < json.length; i++){
        setMarkers(json[i], map);
    }

    markerCluster = new MarkerClusterer(map, markers, {ignoreHiddenMarkers: true, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
}

function setMarkers(marker, map) {
    // var markerMap = marker.geometry.coordinates;
    var title = marker.title;
    var frontline = marker.user_profile__is_trained_frontline;
    var instituition = marker.instituition;
    var district = marker.district;
    var pos = new google.maps.LatLng(marker['latitude'], marker['longitude']);
    var content = marker;

    markerMap = new google.maps.Marker({
        position: pos,
        title: title,
        frontline: frontline,
        instituition: instituition,
        district: district,
        map: map
    });

    markers.push(markerMap);

    var infowindow = new google.maps.InfoWindow({
        content:  "Name:  " +title + '<br/>' +"Level:  "+ frontline + '<br/>'+"Instituition:  " + instituition + '<br/>'+"District:  " + district 
    });    

    // Marker click listener
    google.maps.event.addListener(markerMap, 'click', (function (marker1, content) {
        return function () {
            infowindow.setContent(content);
            infowindow.open(map, markerMap);
            map.panTo(this.getPosition());
            // map.setZoom(15);
        }
    })(markerMap, content));
}

function clusterManager(array) {
    markerCluster.clearMarkers();
    
    for (i=0; i < array.length; i++) {
      markerCluster.addMarker(array[i]);
    }
}

//@todo add inputsearch
function newFilter() {
  
    var filteredMarkers = [];
  
    $.each(markers, function(index, marker) { // on parcourt les markers
      //console.log('maker ', index);
      
      $.each(filters, function(i, categoryFilter) { // on parcourt les différentes catégories présentes dans les filtres
        if (marker.frontline == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
          filteredMarkers.push(marker);
        }
      });
    });
  //console.log('filteredMarkers : ',filteredMarkers);
    
    clusterManager(filteredMarkers);
}

  


$(document).ready(function() {
  
    
  $('.check-filters input').on('change', function(){
    filters = [];
    $('.check-filters input:checked').each(function(index, elem) {
      filters.push($(elem).val());
      alert(filters)
    });
    newFilter(filters);
    //console.log('filters selected : ', filters);
    
    //si tous les filtres sont cochés
    if($('.check-filters input').length == $('.check-filters input:checked').length) {
      //console.log('tous les filtres sont cochés', );
      $('.js-check-all').addClass('active');
    } else {
      //console.log('Pas tous cochés');
      $('.js-check-all').removeClass('active');
    }
  });
  
  $('.js-check-all').on('click', function(e){
    var $obj = $(e.currentTarget);
    $obj.addClass('active');
    $('.check-filters input').prop('checked', 'true').first().change();
  });

});


jQuery(window).on('load', function(){
    initMap();
});