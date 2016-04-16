module Ethos.SelectedList (show) where


import Html exposing (Html, br, div, h4, h5, p, small, text)
import Html.Attributes exposing (class, classList)


import Effect exposing (Effect)
import Effect.List
import Ethos exposing (Ethos, dichotomyToString)


showOne : Maybe Ethos -> List Ethos -> Ethos -> Html
showOne hoveredEthos selectedEthoses ethos =
  div
    [ classList
        [ ("ethos", True)
        , ("notselected", not (Ethos.isSelected selectedEthoses ethos))
        , ("hovered", Ethos.isHovered hoveredEthos ethos)
        ]
    ]
    [ h4 []
        [ text ethos.name
        , br [] []
        , small [] [ text (dichotomyToString ethos.dichotomy) ]
        ]
    , p [] [ text ethos.description ]
    , h5 [] [ text "Effects :" ]
    , Effect.List.show ethos.effects
    ]


show : Maybe Ethos -> List Ethos -> Html
show hoveredEthos selectedEthoses =
  let
    ethoses =
      case hoveredEthos of
        Nothing ->
          selectedEthoses
        Just e ->
          selectedEthoses
            |> List.filter (\x -> x /= e)
            |> List.append [e]
  in
    div
      [ class "selected-ethoses" ]
      (List.map (showOne hoveredEthos selectedEthoses) ethoses)
