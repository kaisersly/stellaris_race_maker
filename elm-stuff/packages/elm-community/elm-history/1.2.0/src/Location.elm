module Location
    ( Location, location
    , reload, Source(ForceServer, AllowCache)
    , assign, replace
    ) where


{-| Facilities related to the browser's `window.location` object.

@docs Location, location, reload, Source, assign, replace
-}


import Task exposing (Task)
import Native.Location


{-| The parts of a location object. Note `port'`, since `port` is a reserved word. -}
type alias Location =
    { href: String
    , protocol: String
    , host: String
    , hostname: String
    , port': String
    , pathname: String
    , search: String
    , hash: String
    , origin: String
    }


{-| A task which, when executed, gets the browser's `window.location` object. -}
location : Task x Location
location = Native.Location.location


{-| Reloads the page from the current URL. -}
reload : Source -> Task String ()
reload source =
    nativeReload <|
        case source of
            ForceServer -> True
            AllowCache -> False


nativeReload : Bool -> Task String ()
nativeReload = Native.Location.reload


{-| Whether to force `reload` to use the server, or allow use of the cache. -}
type Source
    = ForceServer
    | AllowCache


{-| A task which, when executed, loads the resource at the provided URL,
or provides an error message upon failure. This actually loads a new
resource -- it does not merely change the URL in the title bar.

Note that only Firefox appears to reliably report an error -- other browsers
silently fail if an invalid URL is provided.
-}
assign : String -> Task String ()
assign = Native.Location.assign


{-| Like `assign`, loads the resource at the provided URL, but replaces the
current page in the browser's history. This actually loads a new
resource -- it does not merely change the URL in the title bar.

Note that only Firefox appears to reliably report an error -- other browsers
silently fail if an invalid URL is provided.
-}
replace : String -> Task String ()
replace = Native.Location.replace

