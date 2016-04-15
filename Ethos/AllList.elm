module Ethos.AllList (show) where


import Html exposing (Html, div, h2, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import String


import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Ethos.Data


type alias ViewModel =
  { name : String
  , slug : String
  , isSelected : Bool
  }


buildViewModel : List Ethos -> Ethos -> ViewModel
buildViewModel selectedEthoses ethos =
  let
    slug =
      ethos.name
        |> String.toLower
        |> String.words
        |> String.join "-"
  in
    { name = ethos.name
    , slug = slug
    , isSelected = Ethos.isSelected selectedEthoses ethos
    }


onClickAction : Bool -> Ethos -> Action
onClickAction isSelected ethos =
  if isSelected then
    DeselectEthos ethos
  else
    SelectEthos ethos


showOne : Signal.Address Action -> List Ethos -> Ethos -> Html
showOne address selectedEthoses ethos =
  let
    model = buildViewModel selectedEthoses ethos
  in
    li
      [ classList
          [ ("ethos", True)
          , (model.slug, True)
          , ("selected", model.isSelected)
          ]
      , onMouseEnter address (HoverEthos ethos)
      , onMouseLeave address DehoverEthos
      , onClick address (onClickAction model.isSelected ethos)
      ]
      [ text model.name ]


show : Signal.Address Action -> List Ethos -> Html
show address selectedEthoses =
  let
    remainingPoints = Ethos.remainingPoints selectedEthoses
    title = "Ethoses (" ++ (toString remainingPoints) ++ " points left)"
  in
    div
      [ class "all-ethoses" ]
      [ h2 [] [ text title ]
      , ul [] (List.map (showOne address selectedEthoses) Ethos.Data.all)
      ]
