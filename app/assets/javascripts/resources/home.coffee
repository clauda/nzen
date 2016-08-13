swOptions =
  pagination: '.swiper-pagination',
  nextButton: '.swiper-button-next',
  prevButton: '.swiper-button-prev',
  paginationClickable: true,
  autoplay: 2000,

if !NZEN.isMobile
  swOptions.loop = true
  swOptions.spaceBetween = 15
  swOptions.slidesPerView = 3

swiper = new Swiper('.swiper-container', swOptions)
console.log swOptions

if !NZEN.isMobile
  $(".typed").typed
    strings: [
      "consertar o celular ^1000", 
      "de uma boa diarista",
      "de um bom churrasqueiro",
      "reformar meu quarto ^500",
      "contruir um outro quarto ^1000",
      "aprender algo novo! ^1200"
    ],
    typeSpeed: 0

$(window).bind 'scroll', ->
  navHeight = $('#flyer').height() + 100
  if $(window).scrollTop() > navHeight
    $('#search-bar').addClass('fixed')
  else
    $('#search-bar').removeClass('fixed')

$(window).bind 'scroll', ->
  if $(window).scrollTop() > 51
    $('#default .cta').addClass('fixed')
  else
    $('#default .cta').removeClass('fixed')

$('[data-toggle="tooltip"]').tooltip()

toastr.options.showMethod = 'slideDown';
toastr.options.hideMethod = 'slideUp';
toastr.options.closeMethod = 'slideUp';
toastr.options.progressBar = true;
toastr.options.timeOut = 5000;