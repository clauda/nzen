class NZEN.Tracker

  initialize: (category, action)->
    console.log category, action
    @_send(category, action)

  _send: (category, action)->
    console.log category, action
    ga('send', 'event', category, action)
