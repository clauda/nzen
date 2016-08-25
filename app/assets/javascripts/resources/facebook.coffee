
$ ->
  NZEN.initFB()

NZEN.initFB = ->
  @fb_root = null
  @fb_events_bound = false

  @bindFacebookEvents = ->
    $(document)
      .on('page:fetch', saveFacebookRoot)
      .on('page:change', restoreFacebookRoot)
      .on('page:load', ->
        FB?.XFBML.parse()
      )
    @fb_events_bound = true

  saveFacebookRoot = ->
    @fb_root = $('#fb-root').detach()

  restoreFacebookRoot = ->
    if $('#fb-root').length > 0
      $('#fb-root').replaceWith @fb_root
    else
      $('body').append @fb_root

    window.fbAsyncInit = initializeFacebookSDK
    $.getScript("//connect.facebook.net/pt_BR/all.js#xfbml=1&version=v2.7&appId=1139457282744397")

  @loadFacebookSDK = ->
    ((d, s, id) ->
      js = undefined
      fjs = d.getElementsByTagName(s)[0]
      if d.getElementById(id)
        return
      js = d.createElement(s)
      js.id = id
      js.src = '//connect.facebook.net/pt_BR/sdk.js'
      fjs.parentNode.insertBefore js, fjs
      return
    ) document, 'script', 'facebook-jssdk'

  initializeFacebookSDK = ->
    FB.init
      appId     : '1139457282744397'
      cookie    : true
      xfbml     : true
      version   : 'v2.7'

  @loadFacebookSDK()
  @bindFacebookEvents() unless @fb_events_bound

