module Effect.List (show) where


import Html exposing (Html, ul, li)


import Effect exposing (Effect)
import Effect.View


showOne : Effect -> Html
showOne effect =
  li [] [ Effect.View.show effect ]


show : List Effect -> Html
show effects =
  ul [] (List.map showOne effects)
