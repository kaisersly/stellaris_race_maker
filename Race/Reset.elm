module Race.Reset (show) where


import Html exposing (Attribute, Html, button, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


import Model exposing (initialModel)
import Update exposing (Action(Init))


show : Signal.Address Action -> Html
show address =
  button
    [ class "btn btn-default"
    , onClick address (Init initialModel)
    ]
    [ text "Reset" ]
