class exports.Todo extends Backbone.Model

  defaults:
    content: 'empty todo...'
    trackLength:''
    done: false

  toggle: ->
    @save(done: not @get 'done')

  clear: ->
    @destroy()
    @view.remove()
