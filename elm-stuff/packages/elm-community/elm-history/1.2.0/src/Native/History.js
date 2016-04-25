Elm.Native = Elm.Native || {};
Elm.Native.History = {};
Elm.Native.History.make = function(localRuntime){

  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.History = localRuntime.Native.History || {};

  if (localRuntime.Native.History.values){
    return localRuntime.Native.History.values;
  }

  var NS = Elm.Native.Signal.make(localRuntime);
  var Task = Elm.Native.Task.make(localRuntime);
  var Utils = Elm.Native.Utils.make(localRuntime);
  var node = window;

  // path : Signal String
  var path = NS.input('History.path', window.location.pathname);

  // length : Signal Int
  var length = NS.input('History.length', window.history.length);

  // hash : Signal String
  var hash = NS.input('History.hash', window.location.hash);

  // href : Signal String
  var href = NS.input('History.href', window.location.href);

  localRuntime.addListener([href.id, path.id, length.id], node, 'popstate', function getPath(event){
    localRuntime.notify(path.id, window.location.pathname);
    localRuntime.notify(length.id, window.history.length);
    localRuntime.notify(hash.id, window.location.hash);
    localRuntime.notify(href.id, window.location.href);
  });

  localRuntime.addListener([hash.id], node, 'hashchange', function getHash(event){
    localRuntime.notify(hash.id, window.location.hash);
  });

  // setHash : String -> Task error ()
  var setHash = function(hash){
    return Task.asyncFunction(function(callback){
      setTimeout(function(){
        location.hash = hash;
        localRuntime.notify(hash.id, window.location.hash);
        localRuntime.notify(length.id, window.history.length);
        localRuntime.notify(href.id, window.location.href);
      },0);
      return callback(Task.succeed(Utils.Tuple0));
    });
  };

  // setPath : String -> Task error ()
  var setPath = function(urlpath){
    return Task.asyncFunction(function(callback){
      setTimeout(function(){
        window.history.pushState({}, "", urlpath);
        localRuntime.notify(path.id, window.location.pathname);
        localRuntime.notify(hash.id, window.location.hash);
        localRuntime.notify(length.id, window.history.length);
        localRuntime.notify(href.id, window.location.href);
      },0);
      return callback(Task.succeed(Utils.Tuple0));
    });
  };

  // replacePath : String -> Task error ()
  var replacePath = function(urlpath){
    return Task.asyncFunction(function(callback){
      setTimeout(function(){
        window.history.replaceState({}, "", urlpath);
        localRuntime.notify(path.id, window.location.pathname);
        localRuntime.notify(hash.id, window.location.hash);
        localRuntime.notify(length.id, window.history.length);
        localRuntime.notify(href.id, window.location.href);
      },0);
      return callback(Task.succeed(Utils.Tuple0));
    });
  };

  // go : Int -> Task error ()
  var go = function(n){
    return Task.asyncFunction(function(callback){
      setTimeout(function(){
        window.history.go(n);
        localRuntime.notify(length.id, window.history.length);
        localRuntime.notify(hash.id, window.location.hash);
        localRuntime.notify(href.id, window.location.href);
      }, 0);
      return callback(Task.succeed(Utils.Tuple0));
    });
  };

  // back : Task error ()
  var back = Task.asyncFunction(function(callback){
    setTimeout(function(){
      localRuntime.notify(hash.id, window.location.hash);
      window.history.back();
      localRuntime.notify(length.id, window.history.length);
      localRuntime.notify(href.id, window.location.href);
    }, 0);
    return callback(Task.succeed(Utils.Tuple0));
  });

  // forward : Task error ()
  var forward = Task.asyncFunction(function(callback){
    setTimeout(function(){
      window.history.forward();
      localRuntime.notify(length.id, window.history.length);
      localRuntime.notify(hash.id, window.location.hash);
      localRuntime.notify(href.id, window.location.href);
    }, 0);
    return callback(Task.succeed(Utils.Tuple0));
  });



  return {
    path        : path,
    setHash     : setHash,
    setPath     : setPath,
    replacePath : replacePath,
    go          : go,
    back        : back,
    forward     : forward,
    length      : length,
    hash        : hash,
    href        : href
  };

};
