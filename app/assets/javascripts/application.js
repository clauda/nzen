//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require vendor
//= require init
//= require_tree ./resources
//
// Angular Application
// require app/app
// require app/factories/service
// require app/controllers/search_controller
//
//= require_self

$.fn.extend({
  anime: function(effect){
    var ends = 'webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend';
    $(this).addClass('animated ' + effect).one(ends, function(){
      $(this).removeClass('animated ' + effect);
    });
  }
});
