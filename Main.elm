module Main where


import Html exposing (Html)
import StartApp.Simple as StartApp


import Model exposing (initialModel)
import Update exposing (update)
import View exposing (show)


-- main : StartApp.App
main =
  StartApp.start
    { model = initialModel
    , update = update
    , view = show
    }
