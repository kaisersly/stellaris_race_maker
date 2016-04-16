module Trait.AllList (..) where


import Html exposing (Html, div, h2, h4, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)
import String


import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Trait exposing (Trait)
import Trait.Data


prefix : Int -> String
prefix points =
  let
    sign = if points > 0 then "+" else "-"
    many = String.repeat (abs points) sign
  in
    " (" ++ many ++ ")"


showOne : Signal.Address Action -> Maybe Trait -> List Trait -> Trait -> Html
showOne address hoveredTrait selectedTraits trait =
  let
    isSelected = Trait.isSelected selectedTraits trait
    isGreen = trait.points > 0
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
        , ("green", isGreen)
        , ("red", not isGreen)
        ]
      , onMouseEnter address (HoverTrait trait)
      , onMouseLeave address DehoverTrait
      , onClick address onClickAction
      ]
      [ text trait.name
      , text (prefix trait.points)
      ]


show : Signal.Address Action -> Maybe Trait -> List Trait -> Html
show address hoveredTrait selectedTraits =
  let
    remainingPoints = Trait.remainingPoints selectedTraits
    remainingTraits = Trait.remainingTraits selectedTraits
    title =
      "Traits ("
      ++ (toString remainingPoints)
      ++ " points left - "
      ++ (toString remainingTraits)
      ++ " traits left)"
    (goodTraits, badTraits) = List.partition (\x -> x.points > 0) Trait.Data.all
  in
    div
      [ class "all-traits" ]
      [ h2 [] [ text title ]
      , h4 [] [ text "Positive traits" ]
      , ul [] (List.map (showOne address hoveredTrait selectedTraits) goodTraits)
      , h4 [] [ text "Negative traits" ]
      , ul [] (List.map (showOne address hoveredTrait selectedTraits) badTraits)
      ]
