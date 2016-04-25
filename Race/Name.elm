module Race.Name (show) where


import Html exposing (Attribute, Html, div, input, label, text)
import Html.Attributes exposing (class, value)
import Html.Events exposing (on, targetValue)


import Update exposing (Action(SetName))


onInput : Signal.Address a -> (String -> a) -> Attribute
onInput address contentToValue =
  on "input" targetValue (\str -> Signal.message address (contentToValue str))


show : Signal.Address Action -> String -> Html
show address name =
  div
    [ class "form-group" ]
    [ label []
        [ text "Name" ]
    , input
        [ class "form-control"
        , onInput address (\x -> SetName x)
        , value name
        ]
        [ ]

    ]
