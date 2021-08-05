// (function () {
//     "use strict";






//     function initialize() {
//         var mapOptions = {
//             zoom: 8,
//             center: new google.maps.LatLng(7.90690446737339,-1.2044806461391333),
//             mapTypeId: google.maps.MapTypeId.ROADMAP
//         };

//         var map = new google.maps.Map(document.getElementById('map'), mapOptions);

//         // var marker = new google.maps.Marker({
//         //     position: new google.maps.LatLng(7.90690446737339,-1.2044806461391333),
//         // });

//         // marker.setMap(map);
//         // var infowindow = new google.maps.InfoWindow({
//         //     content: "Current Location!"
//         // });


//         // for(var a=0; a<querydata.length; a++){
//         //     const data = [
//         //     {
//         //         lat: querydata.latitude,
//         //         lng: querydata.longitude
//         //     }
            
//         // ];

//         // var marker = new google.maps.Marker({
//         //      position: new google.maps.LatLng(data),
//         // });

//         // map.data.add({
//         //     geometry: new google.maps.LatLng([
//         //       data
//         //     ]),
//         //   });
//         var infowindow = new google.maps.InfoWindow();

//         var marker, i;

//         // $.get('/feltp/queryjson', function(querydata){

//           //   for (i = 0; i < querydata.length; i++) {  
//           // marker = new google.maps.Marker({
//           //   position: new google.maps.LatLng(querydata[i][4], querydata[i][3]),
//           //   map: map
//           // });

//           // console.log(marker)

//           // google.maps.event.addListener(marker, 'click', (function(marker, i) {
//           //   return function() {
//           //     infowindow.setContent(querydata[i][0]);
//           //     infowindow.open(map, marker);
//           //   }
//           // })(marker, i));
       
//         // }
//              // alert({{query}})
//         // })

        

        


//         // map.data.loadGeoJson('/feltp/queryjson')

//         // infowindow.open(map, marker);

//         // //add overlay
//         // map.controls[google.maps.ControlPosition.RIGHT_BOTTOM].push(document.getElementById('map-overlay'));
//     }

//     google.maps.event.addDomListener(window, 'load', initialize);
//    // navigator.geolocation.getCurrentPosition(initialize);
//     jQuery(document).ready(function ($) {


//         $(".embed-responsive iframe").addClass("embed-responsive-item");
//         $(".carousel-inner .item:first-child").addClass("active");

//         $('[data-toggle="tooltip"]').tooltip();

//         $('.gallery-btn a').click(function () {

//             $(".gallery-btn a").removeClass("active");
//             $(this).addClass("active");

//             var selector = $(this).attr('data-filter');
//             $(".gellery-item").isotope({
//                 filter: selector,
//                 animationOptions: {
//                     duration: 750,
//                     easing: 'linear',
//                     queue: false
//                 }
//             });
//             return false;
//         });
//        // jQeury smooth scroll
//         $("li.smooth-scroll a").bind("click", function(event){
//             var $anchor = $(this);
//             var headerH = "50";
//             $("html, body")
//                 .stop()
//                 .animate({
//                 scrollTop: $($anchor.attr("href"))
//                     .offset()
//                     .top - headerH + "px"
//             }, 1200, "easeOutCirc");

//             event.preventDefault();

//         });
//         //jquery scroll spy
//         $("body").scrollspy({
//             target: ".navbar-collapse",
//             offset: 95
//         });
//         new WOW().init();
//         //Pretty Photo
//         $("a[data-gallery^='prettyPhoto']").prettyPhoto({
//             social_tools: false
//         });
//     });


//     jQuery(window).load(function () {


//     });


// }(jQuery));