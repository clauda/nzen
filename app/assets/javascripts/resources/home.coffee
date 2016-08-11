swiper = new Swiper('.swiper-container',
  pagination: '.swiper-pagination',
  nextButton: '.swiper-button-next',
  prevButton: '.swiper-button-prev',
  slidesPerView: 3,
  paginationClickable: true,
  spaceBetween: 15,
  autoplay: 2000,
  loop: true
)

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