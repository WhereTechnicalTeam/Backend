

(function () {
    "use strict";






    function initialize() {
        var mapOptions = {
            zoom: 8,
            center: new google.maps.LatLng(7.90690446737339,-1.2044806461391333),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        var map = new google.maps.Map(document.getElementById('map'), mapOptions);


        var infowindow = new google.maps.InfoWindow();

        var marker, i;

        $.get('/feltp/queryjson', function(querydata){

            for (i = 0; i < querydata.length; i++) {  
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(querydata[i]['latitude'], querydata[i]['longitude']),
            map: map
          });

          const contentString="<div><p>Institution: "+ querydata[i]['current_institution']+"</p><p>Region:  "+ querydata[i]['region__region_name']+"</p><p>District:  "+ querydata[i]['district__district_name']+"</p></div>"

          google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
              infowindow.setContent(contentString);
              infowindow.open(map, marker);
            }
          })(marker, i));
       
        }
             // alert(querydata[1]['longitude'])
        })

        

         // Create the search box and link it to the UI element.
           // Create the search box and link it to the UI element.
  const input = document.getElementById("pac-input");
  const searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  // Bias the SearchBox results towards current map's viewport.
  map.addListener("bounds_changed", () => {
    searchBox.setBounds(map.getBounds());
  });
  let markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener("places_changed", () => {
    const places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }
    // Clear out the old markers.
    markers.forEach((marker) => {
      marker.setMap(null);
    });
    markers = [];
    // For each place, get the icon, name and location.
    const bounds = new google.maps.LatLngBounds();
    places.forEach((place) => {
      if (!place.geometry || !place.geometry.location) {
        console.log("Returned place contains no geometry");
        return;
      }
      const icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25),
      };
      // Create a marker for each place.
      markers.push(
        new google.maps.Marker({
          map,
          icon,
          title: place.name,
          position: place.geometry.location,
        })
      );

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
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