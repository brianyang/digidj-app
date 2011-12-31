class exports.MainRouter extends Backbone.Router
  routes :
    "home": "home"
    "browse": "browse"

  home: ->
    app.views.home.render()
    app.collections.todos.fetch()

  browse: ->
    app.views.browse.render()
    app.collections.tracks.fetch()
