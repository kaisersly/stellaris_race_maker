import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Task
import Dict
import Signal exposing (Signal)
import String

import StartApp exposing (start)
import Effects exposing (Effects, Never)

import History


type alias Model =
  { data : Dict.Dict String String
  , current : String
  }

init : String -> (Model, Effects Action)
init key =
  ( Model (Dict.fromList [ ("a", "I'm #a"), ("b", "I'm #b") ]) key
  , followHash key)


type Action
  = Route String
  | FollowHash String
  | SettedHistory (Maybe String)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Route a ->
      ( Model model.data a, Effects.none )
    FollowHash a ->
      ( Model model.data a, followHash a )
    SettedHistory h ->
      ( model, Effects.none )


followHash url =
  History.setPath ("#" ++ url)
  |> Task.map (always url)
  |> Task.toMaybe
  |> Task.map SettedHistory
  |> Effects.task


routes =
  let
    dedupHashes = (Signal.dropRepeats History.hash)
    hash2route = (String.dropLeft 1)
  in
    Signal.map Route (Signal.map hash2route dedupHashes)


view : Signal.Address Action -> Model -> Html
view address model =
  let
    current = (Maybe.withDefault ("missing #" ++ model.current ++ "!") (Dict.get model.current model.data))
  in
    span []
    [ h2 [] [ text current ]
    , div [] [ text "Click on a link or update the url manually" ]
    , div [] [ a [ href "#a" ] [ text "link to #a" ] ]
    , div [] [ a [ href "#b" ] [ text "link to #b" ] ]
    , div [] [ a [ href "#c" ] [ text "link to #c" ] ]
    , button [ onClick address (FollowHash "a") ] [ text "a" ]
    , button [ onClick address (FollowHash "b") ] [ text "b" ]
    , button [ onClick address (FollowHash "c") ] [ text "c" ]
    ]

app =
  StartApp.start
    { init = init "a"
    , update = update
    , view = view
    , inputs = [ routes ]
    }


main =
  app.html

port tasks : Signal (Task.Task Never ())
port tasks =
  app.tasks

