homeTracksTemplate = require('templates/home_tracks')

class exports.HomeTracksView extends Backbone.View

  el: '#home-tracks-view'

  render: ->
    @$(@el).html homeTracksTemplate()
    @$(@el).find('#todo-app').append app.views.newTodo.render().el
    @$(@el).find('#todo-app').append app.views.todos.render().el
    @$(@el).find('#todo-app').append app.views.stats.render().el
    @
