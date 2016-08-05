NZEN.initMenu = ->
  bodyEl = document.body
  content = document.querySelector('body')
  openbtn = document.getElementById('pin-side-menu-btn')
  closebtn = document.getElementById('pin-side-menu-close-button')
  isOpen = false

  
  initEvents = ->
    if (openbtn)
      openbtn.addEventListener('click', toggleMenu)
    if (closebtn)
      closebtn.addEventListener('click', toggleMenu);

    # // close the menu element if the target it´s not the menu element or one of its descendants..
    # // content.addEventListener( 'click', function(ev) {
    # //     var target = ev.target;
    # //     if( isOpen && target !== openbtn ) {
    # //         toggleMenu();
    # //     }
    # // } );

  toggleMenu = ->
    if (isOpen)
      classie.remove(bodyEl, 'pin-show-menu');
    else
      classie.add(bodyEl, 'pin-show-menu');
    isOpen = !isOpen

  initEvents()

NZEN.initMenu()