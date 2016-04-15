module Effect.Summary.View (show) where


import Html exposing (Html, div)
import Html.Attributes exposing (class)


import Effect exposing (Effect)
import Effect.Summary exposing (summarize)
import Effect.List


show : List Effect -> Html
show effects =
  let
    (simpleEffects, effectsWithAmount) = List.partition (\x -> x.amount == 0) effects

  in
    div
      [ class "effects" ]
      [ Effect.List.show simpleEffects
      , Effect.List.show (summarize effectsWithAmount)
      ]
