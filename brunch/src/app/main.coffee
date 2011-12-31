window.app = {}
app.routers = {}
app.models = {}
app.collections = {}
app.views = {}

Todos = require('collections/todos_collection').Todos

Tracks = require('collections/tracks_collection').Tracks
MainRouter = require('routers/main_router').MainRouter

# HomeViewTracks = require('views/home_tracks_view').HomeView
HomeView = require('views/home_view').HomeView
NewTodoView = require('views/new_todo_view').NewTodoView
TodosView = require('views/todos_view').TodosView
StatsView = require('views/stats_view').StatsView
TodoView = require('views/todos_view').TodoView

# app bootstrapping on document ready
$(document).ready ->
  app.initialize = ->
    app.collections.todos = new Todos()

    app.routers.main = new MainRouter()
    app.views.home = new HomeView()
    app.views.newTodo = new NewTodoView()
    app.views.todos = new TodosView()
    app.views.stats = new StatsView()

    Backbone.history.navigate('home', false) if Backbone.history.getFragment() is ''
  app.initialize()
  Backbone.history.start()
