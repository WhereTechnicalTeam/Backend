









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


 $.get('/queryjson', function(result){
    // queryjson = querydata
    // result = JSON.parse(JSON.stringify(queryjson))
    // console.log(result)

    for (i = 0; i < result.length; i++) {
      if (['user_profile__is_trained_frontline'] in result[i]){
        result[i]['user_profile__is_trained_frontline'] = 'frontline'
        result[i]['level'] = result[i]['user_profile__is_trained_frontline']
      }
      if (['user_profile__is_trained_intermediate'] in result[i]){
        result[i]['user_profile__is_trained_intermediate'] = 'intermediate'
        result[i]['level'] = result[i]['user_profile__is_trained_intermediate']
      }
      if (['user_profile__is_trained_advanced'] in result[i]){
        result[i]['user_profile__is_trained_advanced'] = 'advanced'
        result[i]['level'] = result[i]['user_profile__is_trained_advanced']
      }
    }


    for (var i = 0; i < result.length; i++){
        setMarkers(result[i], map);
    }


  })
      

    // for (var i = 0; i < json.length; i++){
    //     setMarkers(json[i], map);
    // }

    // markerCluster = new MarkerClusterer(map, markers, {ignoreHiddenMarkers: true, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});


}

function setMarkers(marker, map) {
    // var markerMap = marker.geometry.coordinates;
    var title = marker.title;
    var Level = marker.Level;
    var instituition = marker.instituition;
    var district = marker.district;
    var pos = new google.maps.LatLng(marker['latitude'], marker['longitude']);
    var content = marker;

    markerMap = new google.maps.Marker({
        position: pos,
        title: title,
        Level: Level,
        instituition: instituition,
        district: district,
        map: map
    });

    markers.push(markerMap);

    var infowindow = new google.maps.InfoWindow({
        content:  "Name:  " +title + '<br/>' +"Level:  "+ Level + '<br/>'+"Instituition:  " + instituition + '<br/>'+"District:  " + district 
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
  alert(1)
    $.each(markers, function(index, marker) { // on parcourt les markers
      //console.log('maker ', index);
      console.log(marker)
    
      
      $.each(filters, function(i, categoryFilter) {
        if (marker.Level == categoryFilter) {
          filteredMarkers.push(marker);
        }
      });
    });
    
    // clearMarkers(filteredMarkers);
}

      // Sets the map on all markers in the array.  
    function setMapOnAll(map) {  
      for (var i = 0; i < markers.length; i++) {  
        markers[i].setMap(map);  
      }  
    } 


    // Removes the markers from the map, but keeps them in the array.  
    function clearMarkers() {  
      setMapOnAll(null);  
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