






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
    console.log(result)

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


     
    markerCluster = new MarkerClusterer(map, [], {ignoreHiddenMarkers: true,  imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});

  })


}

// markerCluster = new MarkerClusterer(map, markers)
var infowindow = new google.maps.InfoWindow();

function setMarkers(marker, map) {
    var title = marker.job_title;
    var Level = marker.level;
    var instituition = marker.current_institution;
    var district = marker.district__district_name;
    var region = marker.region__region_name;
    var pos = new google.maps.LatLng(marker['latitude'], marker['longitude']);
    var content = marker;
    var anchor = pos;

    markerMap = new google.maps.Marker({
        position: pos,
        title : title,
        district: district,
        region : region,
        instituition : instituition,
        Level: marker['level'],
        map: map
    });

    markers.push(markerMap);
    // markerCluster.addMarker(markers);

   
    // const contentString="Job:  " +title + '<br/>' +"Level:  "+ Level + '<br/>'+"Instituition:  " + instituition + '<br/>'+"District:  " + district + '<br/>'+"Region:  " + region 
    const contentString = "<div><p>Job: "+ title+ "</p><p>Institution: "+ instituition +"</p><p>Level: "+ Level +"</p><p>District:  "+ district+"</p><p>Region:  "+ region +"</p></div>"


    // Marker click listener
     google.maps.event.addListener(markerMap, 'click', (function(marker1, content) {
        return function() {
          infowindow.setContent(contentString);
          infowindow.open(map, markerMap);
          infowindow.setPosition(pos);
          // map.panTo(this.getPosition());
        }
      })(markerMap, content));

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


    // Shows any markers currently in the array.  
    function showMarkers() {  
      setMapOnAll(map);  
    }  
      
    // Deletes all markers in the array by removing references to them.  
    function deleteMarkers() {  
      clearMarkers();  
      markers = [];  
    } 



       
function clusterManager(array) {
    setMapOnAll(null);  
    markerCluster.clearMarkers();
    
    for (i=0; i < array.length; i++) {
      markerCluster.addMarker(array[i]);
    }
}
          

function newFilter() {
  
    var filteredMarkers = [];
  
    $.each(markers, function(index, marker) { // on parcourt les markers
      
      $.each(filters, function(i, categoryFilter) { // on parcourt les diff??rentes cat??gories pr??sentes dans les filtres

        if (marker.Level == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
          filteredMarkers.push(marker);
 
        }
      });
    });
    // clearMarkers(markers);
    // showMarkers(filteredMarkers);


    clusterManager(filteredMarkers);

}


function regFilter(categoryFilter) {
  
    var filteredMarkers = [];
  
    $.each(markers, function(index, marker) { // on parcourt les markers
      
      if (marker.region == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
        // alert(categoryFilter)
          filteredMarkers.push(marker);
      }
      // $.each(regfilters, function(i, categoryFilter) { // on parcourt les diff??rentes cat??gories pr??sentes dans les filtres

      //   if (marker.Region == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
      //     filteredMarkers.push(marker);
 
      //   }
      // });
    });

    clusterManager(filteredMarkers);

}

  
// region filter
  $('#reg').on('change', function(){
    regfilters = $('#reg option:selected').val()
    regFilter(regfilters);
  })



//   level filter
  $('.check-filters input').on('change', function(){
    filters = [];
    $('.check-filters input:checked').each(function(index, elem) {
      filters.push($(elem).val());
      //alert(filters)
    });
    newFilter(filters);
    //console.log('filters selected : ', filters);
    
    //si tous les filtres sont coch??s
    if($('.check-filters input').length == $('.check-filters input:checked').length) {
      //console.log('tous les filtres sont coch??s', );
      $('.js-check-all').addClass('active');
    } else {
      //console.log('Pas tous coch??s');
      $('.js-check-all').removeClass('active');
    }
  });
  
  $('.js-check-all').on('click', function(e){
    var $obj = $(e.currentTarget);
    $obj.addClass('active');
    $('.check-filters input').prop('checked', 'true').first().change();
  });




jQuery(window).on('load', function(){
    initMap();
});