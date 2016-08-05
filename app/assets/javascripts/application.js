//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require vendor
//= require init
//= require_tree ./resources
//
// Angular Application
//= require app/app
//= require app/factories/service
//= require app/controllers/search_controller
//
//= require_self

$(document).on('turbolinks:load', function(){
  NZEN.initMenu();
});

$(document).one('turbolinks:load', function(){
  NZEN.bootstraped = false;
  if (!NZEN.bootstraped) {
    angular.bootstrap(document, ['pinio']); // Manual Initialization
    NZEN.bootstraped = true;
  }
  console.log(NZEN);
});