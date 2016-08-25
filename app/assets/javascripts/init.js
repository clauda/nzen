var NZEN = NZEN || {};

NZEN.isMobile = $(window).width() < 768;

NZEN.clickEffects = function(){
  $('.cbutton').on('click', function(){
    var $el = $(this);
    $el.addClass("cbutton--click");
    setTimeout(function(){
      $el.removeClass("cbutton--click");
    }, 400);
  });
}

$(document).on('page:change', function(){
  NZEN.initMenu();
  NZEN.initFB();
  NZEN.clickEffects();
  // when in service page
  if (!!$('.services-show').length) { 
    NZEN.issuesModal(); 
    NZEN.ratings(); 
  }
});

$(document).on('turbolinks:request-end', function(){
  FB.init({ appId: '1139457282744397', cookie: true, xfbml: true, version: 'v2.5' })
});

// $(document).one('turbolinks:load', function(){
//   NZEN.bootstraped = false;
//   if (!NZEN.bootstraped) {
//     angular.bootstrap(document, ['pinio']); // Manual Initialization
//     NZEN.bootstraped = true;
//   }
// });