module Trait.AllList (..) where


import Html exposing (Html, div, h2, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)


import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Trait exposing (Trait)
import Trait.Data


showOne : Signal.Address Action -> Maybe Trait -> List Trait -> Trait -> Html
showOne address hoveredTrait selectedTraits trait =
  let
    isSelected = Trait.isSelected selectedTraits trait
    onClickAction =
      if isSelected then
        DeselectTrait trait
      else
        SelectTrait trait
  in
    li
      [ classList
        [ ("trait", True)
        , ("selected", isSelected)
        ]
--       , onMouseEnter address (HoverTrait government)
--       , onMouseLeave address DehoverTrait
      , onClick address onClickAction
      ]
      [ text trait.name ]
--
--
show : Signal.Address Action -> Maybe Trait -> List Trait -> Html
show address hoveredTrait selectedTraits =
  let
    remainingPoints = Trait.remainingPoints selectedTraits
    title = "Traits (" ++ (toString remainingPoints) ++ " points left)"
  in
    div
      [ class "all-traits" ]
      [ h2 [] [ text title ]
      , ul [] (List.map (showOne address hoveredTrait selectedTraits) Trait.Data.all)
      ]
