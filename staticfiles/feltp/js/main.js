

(function () {
    "use strict";





        var markers = [];
        var markerCluster;
        var filterSelect = jQuery('.filter');

        var filters;



    function initialize() {
        var mapOptions = {
            zoom: 8,
            center: new google.maps.LatLng(7.90690446737339,-1.2044806461391333),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById('map'), mapOptions);


        var infowindow = new google.maps.InfoWindow();

        var marker, i, queryjson;

        $.get('/queryjson', function(querydata){
            queryjson = querydata
            // alert(queryjson)
            // alert(querydata[1]['user_profile__is_trained_intermediate'])

            for (i = 0; i < queryjson.length; i++) {
              queryjson[i]['user_profile__is_trained_frontline'] = 'frontline'
              queryjson[i]['user_profile__is_trained_intermediate'] = 'intermediate'
              queryjson[i]['user_profile__is_trained_advanced'] = 'advanced'
              // alert(queryjson[i]['user_profile__is_trained_intermediate'])
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(queryjson[i]['latitude'], queryjson[i]['longitude']),
            map: map
          });

        // markerCluster = new MarkerClusterer(map, markers, {ignoreHiddenMarkers: true, imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
        markers.push(marker);
        // alert(markers)
          const contentString="<div><p>Name: "+ queryjson[i]['user_profile__firstname']+' &nbsp'+ queryjson[i]['user_profile__surname']+ "</p><p>Institution: "+ queryjson[i]['current_institution']+"</p><p>Region:  "+ queryjson[i]['region__region_name']+"</p><p>District:  "+ queryjson[i]['district__district_name']+"</p></div>"

          google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
              infowindow.setContent(contentString);
              infowindow.open(map, marker);
              map.panTo(this.getPosition());
            }
          })(marker, i));
       
        }
             // alert(querydata[1]['longitude'])
        })

        





        function clusterManager(array) {
            // markerCluster.clearMarkers();
            
            for (i=0; i < array.length; i++) {
              markerCluster.addMarker(array[i]);
            }
        }


        //@todo add inputsearch
        function newFilter() {
          
            var filteredMarkers = [];
          
            $.each(markers, function(index, markerl) { // on parcourt les markers
              //console.log('maker ', index);
              
              $.each(filters, function(i, categoryFilter) { // on parcourt les différentes catégories présentes dans les filtres
            
                if (marker['user_profile__is_trained_frontline'] == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
                  filteredMarkers.push(markerl);
                }
                if (marker['user_profile__is_trained_intermediate'] == categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
                  filteredMarkers.push(markerl);
                }
                if (marker['user_profile__is_trained_advanced']== categoryFilter) {//si le marker est l'une des categories, on l'ajoute au filteredMarkers
                  filteredMarkers.push(markerl);
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
            });
            newFilter(filters);
            // console.log('filters selected : ', filters);
            // alert(filters)
            
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


        // infowindow.open(map, marker);

        // //add overlay
        // map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(document.getElementById('map-overlay'));
    }

    google.maps.event.addDomListener(window, 'load', initialize);
   // navigator.geolocation.getCurrentPosition(initialize);
    jQuery(document).ready(function ($) {


        $(".embed-responsive iframe").addClass("embed-responsive-item");
        $(".carousel-inner .item:first-child").addClass("active");

        $('[data-toggle="tooltip"]').tooltip();

        $('.gallery-btn a').click(function () {

            $(".gallery-btn a").removeClass("active");
            $(this).addClass("active");

            var selector = $(this).attr('data-filter');
            $(".gellery-item").isotope({
                filter: selector,
                animationOptions: {
                    duration: 750,
                    easing: 'linear',
                    queue: false
                }
            });
            return false;
        });
       // jQeury smooth scroll
        $("li.smooth-scroll a").bind("click", function(event){
            var $anchor = $(this);
            var headerH = "50";
            $("html, body")
                .stop()
                .animate({
                scrollTop: $($anchor.attr("href"))
                    .offset()
                    .top - headerH + "px"
            }, 1200, "easeOutCirc");

            event.preventDefault();

        });
        //jquery scroll spy
        $("body").scrollspy({
            target: ".navbar-collapse",
            offset: 95
        });
        new WOW().init();
        //Pretty Photo
        $("a[data-gallery^='prettyPhoto']").prettyPhoto({
            social_tools: false
        });
    });


    jQuery(window).load(function () {


    });


}(jQuery));