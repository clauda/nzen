var NZEN = NZEN || {};

NZEN.clickEffects = function(){
  $('.cbutton').on('click', function(){
    var $el = $(this);
    $el.addClass("cbutton--click");
    setTimeout(function(){
      $el.removeClass("cbutton--click");
    }, 400);
  });
}

$(document).on('turbolinks:load', function(){
  NZEN.initMenu();
  NZEN.initFB();
  NZEN.clickEffects();
  if (!!$('.services-show').length) { 
    NZEN.issuesModal(); 
    NZEN.ratings(); 
  }
});

$(document).one('turbolinks:load', function(){
  NZEN.bootstraped = false;
  if (!NZEN.bootstraped) {
    angular.bootstrap(document, ['pinio']); // Manual Initialization
    NZEN.bootstraped = true;
  }
});