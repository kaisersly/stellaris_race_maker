Elm.Native = Elm.Native || {};
Elm.Native.Location = Elm.Native.Location || {};

Elm.Native.Location.make = function (localRuntime) {
    localRuntime.Native = localRuntime.Native || {};
    localRuntime.Native.Location = localRuntime.Native.Location || {};

    if (!localRuntime.Native.Location.values) {
        var Task = Elm.Native.Task.make(localRuntime);
        var Utils = Elm.Native.Utils.make(localRuntime);

        localRuntime.Native.Location.values = {
            location: Task.asyncFunction(function (callback) {
                var loc = window.location;

                // We can't return the location object itself, because
                // it would be "live" ... we make a snapshot.
                var location = {
                    href: loc.href,
                    protocol: loc.protocol,
                    host: loc.host,
                    hostname: loc.hostname,
                    // Deal with Elm reserved word
                    port$: loc.port,
                    pathname: loc.pathname,
                    search: loc.search,
                    hash: loc.hash,
                    origin: loc.origin
                };

                // Polyfill for IE
                if (!location.origin) {
                    location.origin =
                        location.protocol + "//" +
                        location.hostname +
                        (location.port ? ':' + location.port: '');
                }

                callback(Task.succeed(location));
            }),

            reload: function (forceServer) {
                return Task.asyncFunction(function (callback) {
                    try {
                        window.location.reload(forceServer);

                        // Now, I suppose this won't really accomplish
                        // anything, but let's do it anyway.
                        callback(
                            Task.succeed(Utils.Tuple0)
                        );
                    } catch (ex) {
                        callback(
                            Task.fail(ex.toString())
                        );
                    }
                });
            },

            assign: function (url) {
                return Task.asyncFunction(function (callback) {
                    try {
                        window.location.assign(url);

                        callback(
                            Task.succeed(Utils.Tuple0)
                        );
                    } catch (ex) {
                        callback(
                            Task.fail(ex.toString())
                        );
                    }
                });
            },

            replace: function (url) {
                return Task.asyncFunction(function (callback) {
                    try {
                        window.location.replace(url);

                        callback(
                            Task.succeed(Utils.Tuple0)
                        );
                    } catch (ex) {
                        callback(
                            Task.fail(ex.toString())
                        );
                    }
                });
            }
        };
    }

    return localRuntime.Native.Location.values;
};

