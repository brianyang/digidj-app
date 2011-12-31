
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , spotify = require('spotify')
  , request = require('request')
  , jquery = require('jquery')

var app = module.exports = express.createServer();

// Configuration





app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({ dumpExceptions: true, showStack: true })); 
});

app.configure('production', function(){
  app.use(express.errorHandler()); 
});

// Routes

app.get('/', routes.index);

app.get('/spotify-songs/:keyword', function(req,res){
    

request('http://localhost:3000/spotify/' + req.params.keyword, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var parsedJSON = JSON.parse(body)
  , trackLen = parsedJSON.tracks.length
  , trackNames = []
    for (var i = 0;i<trackLen;i++){
        if (parsedJSON.tracks[i].name.length){
          trackNames.push(parsedJSON.tracks[i].name)                 
        }
    }
      console.log(trackNames)


  function eliminateDuplicates(arr) {
  var i,
      len=arr.length,
      out=[],
      obj={};

  for (i=0;i<len;i++) {
    obj[arr[i]]=0;
  }
  for (i in obj) {
    out.push(i);
  }
  return out;
}
    uniqueArr = eliminateDuplicates(trackNames)
  }
  res.render('templateName', uniqueArr)

})



})

app.get('/spotify/:id', function(req, res){
  var queryVal = req.params.id.toString()

//  res.send(req.params.id)	

  spotify.search({ type: 'track', query: queryVal }, function(err, data) {
    if ( err ) {
        console.log('Error occurred: ' + err);
        return;
    }

  for (var i=0;i<data.tracks.length;i++){
    var trackArr = trackArr || []
    trackArr.push(data.tracks[i].name)
  }

  res.json(data) 

  })
})




app.listen(port = process.env.PORT || 3000);
console.log("Express server listening on port %d in %s mode", app.address().port, app.settings.env);
