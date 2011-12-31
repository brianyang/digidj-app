newTodoTemplate = require('templates/new_todo')
$ ?= require 'jquery'

class exports.NewTodoView extends Backbone.View

  id: 'new-todo-view'

  events:
    'keypress #new-todo'  : 'createOnEnter'
    'keyup #new-todo'     : 'showHint'
    'keyup #new-todo'     : 'execQuery'

  render: ->
    @$(@el).html newTodoTemplate()
    @

  newAttributes: ->
    attributes =
      order: app.collections.todos.nextOrder()
    attributes.content = @$("#new-todo").val() if @$("#new-todo").val()
    attributes

  createOnEnter: (event) ->
    return unless event.keyCode is $.ui.keyCode.ENTER
    app.collections.todos.create @newAttributes()
    fetchQuery = $('#new-todo').val().trim()
    @$("#new-todo").val ''
    $.ajax '/spotify/'+fetchQuery,
      type: 'GET'
      dataType:'JSON'
      success:(data, textStatus, jqXHR)->
        trackLen = data.tracks[0].length / 60
        trackAlbum = data.tracks[0].album.name
#        trackArtist1 = data.tracks[0].artist.name
#        console.log(data)
        console.log('album title:' + trackAlbum)
        console.log('song length:' + trackLen)
#        console.log('song artist:' + trackArtist1)
        $('#todos-view li:last-child').append('<em>' + trackLen + '</em')


  showHint: (event) ->
    tooltip = @$(".ui-tooltip-top")
    input = @$("#new-todo")
    tooltip.fadeOut()
    clearTimeout(@tooltipTimeout) if @tooltipTimeout
    return if input.val() is '' or  input.val() is input.attr 'placeholder'
    fadeIn = ->
      tooltip.fadeIn()
    @tooltipTimeout = _.delay fadeIn, 1000

  execQuery: ->
    curQuery = @$("input").val()
    console.log(curQuery)

    $.ajax '/spotify/'+curQuery,
      type: 'GET'
      dataType:'JSON'
      success:(data, textStatus, jqXHR)->
        #        $('body').append 'foo'
        trackLen = data.tracks.length
#        console.log(trackLen)
        queryVal = data.info.query


#        console.log(data.tracks[num].name) for num in [1..8]

#        trackArtistNames = {}
#        artistNames = []

        trackNames=[]
        trackLengths=[]
        trackArtists=[]
        trackNames.push(data.tracks[num].name) for num in [1..99]

        trackLengths.push('foo')
#        artistNames.push(data.tracks[num].artists[0].name) for num in [1..50]

        # debug this line
#        trackArtistNames.push({track:data.tracks[num].name : data.tracks[num].artists[0].name}) for num in [1..25]

        Array::unique = ->
          output = {}
          output[@[key]] = @[key] for key in [0...@length]
          value for key, value of output

        sortedTracks = trackNames.unique().sort()
#        console.log(data)
        console.log(trackLengths)
#        console.log(sortedTracks)
#        console.log(artistNames)
#        console.log('trackArtistnames : ' + trackArtistNames)
        
         
        `$("#new-todo").autocomplete({
          source:sortedTracks
        })`
          

#        console.log(data)
#         trackName = data.tracks[i].name
#        console.log(queryVal)

#        console.log(data.tracks[i].name) for data in data
        # console.log(data)
#         console.log(data.tracks)

#        console.log(data.tracks[i].name) for i in [1..trackLen]

#        newTrack = data.tracks[i].name
#        console.log(newTrack)
#        trackNames.push(newTrack) for i in [1..trackLen]

#        console.log(data.tracks[seq].name) for seq in[1..5]
        


###
        console.log(this.name) for name in tracks
        console.log($(this))
        trackNames.push(this) for trackName in trackNames
        console.log(trackNames)
###



#        console.log(trackNames)
#        console.log(trackName) for trackName in trackNames


#         x for x in [1..trackLen]
  #         console.log(data.tracks[i].name)

###
	# refactor coffeescript

     $.getJSON('http://localhost:3000/spotify/foo+fighters', function(data){
       console.log(data)
     })

     
     $.getJSON('http://localhost:3000/spotify/foo+fighters', ->
     console.log(data)


     var eachTrack = function(i){
       return i
     }

      # example line
     eachTrack = (i) -> i

      # func js
     var eachTrack = $(data.tracks).each(function(i){
       trackData = trackData || []
       trackData.push(data.tracks[i].name)
       console.log(trackData)
     })

      #untested 
     eachTrack = (data.tracks).each -> trackData = trackData || []; trackData.push(data.tracks[i].name); console.log(trackData)
  
      # refactor 
      dataTracks = data.tracks
      i = 0
      if dataTracks > i
        i++
        trackData = trackData || []
        trackData.push(data.tracks[i].name
      alert(trackData)

    )

       ###
    
