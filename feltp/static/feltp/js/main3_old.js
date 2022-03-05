

let map;
let markers = [];
var result;
var filters;





//creation de la map
function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 6,
      center: new google.maps.LatLng(7.90690446737339,-1.2044806461391333)
    });


var infowindow = new google.maps.InfoWindow();

var marker, i, queryjson;

 $.get('/queryjson', function(result){
    // queryjson = querydata
    result = JSON.parse(JSON.stringify(queryjson))
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
      

      
      
      marker = new google.maps.Marker({
            position: new google.maps.LatLng(result[i]['latitude'], result[i]['longitude']),
            map: map
          });

        //markerCluster = new MarkerClusterer(map, markers, {ignoreHiddenMarkers: true, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
        markers.push(marker);
        console.log(markers)
        
      const contentString="<div><p>Name: "+ result[i]['user_profile__firstname']+' &nbsp'+ result[i]['user_profile__surname']+ "</p><p>Institution: "+ result[i]['current_institution']+"</p><p>Region:  "+ result[i]['region__region_name']+"</p><p>District:  "+ result[i]['district__district_name']+"</p></div>"

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(contentString);
          infowindow.open(map, marker);
          map.panTo(this.getPosition());
        }
      })(marker, i));
    };
    




    })

}

function newFilter() {
  
    var filteredMarkers = [];
  
    $.each(markers, function(index, markerl) { // on parcourt les markers
      console.log(markerl, index);
      // alert(marker.toString())
      console.log(JSON.stringify(markerl, null,2))
      
      $.each(filters, function(i, categoryFilter) { // on parcourt les différentes catégories présentes dans les filtres
        // alert(marker.user_profile__is_trained_frontline)
        if (markerl.level == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
          filteredMarkers.push(markerl);
      alert(categoryFilter)
        }
      });
    });
}
  


$(document).ready(function() {
  
    
  $('.check-filters input').on('change', function(){
    filters = [];
    $('.check-filters input:checked').each(function(index, elem) {
      filters.push($(elem).val());
      //alert(filters)
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