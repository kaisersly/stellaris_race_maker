module Trait.SelectedList (show) where


import Html exposing (Html, br, div, h4, h5, li, p, small, text, ul)
import Html.Attributes exposing (class, classList)


import Effect exposing (Effect)
import Effect.Summary.View
import Trait exposing (Trait)
import Trait.Data


stringListWithTitle : String -> List String -> Html
stringListWithTitle title list =
  if List.isEmpty list then
    text ""
  else
    div []
      [ h5 [] [ text title ]
      , ul [] (List.map (\name ->
          li [] [ text name ]) list)
      ]


showOne : Maybe Trait -> List Trait -> Trait -> Html
showOne hoveredTrait selectedTraits trait =
  let
    points =
      if abs trait.points == 1 then
        (toString trait.points) ++ " point"
      else
        (toString trait.points) ++ " points"
    ofSameFamily =
      Trait.ofSameFamily Trait.Data.all trait
  in
    div
      [ classList
        [ ("trait", True)
        , ("notselected", not (Trait.isSelected selectedTraits trait))
        , ("hovered", Trait.isHovered hoveredTrait trait)
        ]
      ]
      [ h4 []
          [ text trait.name
          , br [] []
          , small [] [ text (if trait.points > 0 then "Positive trait" else "Negative trait") ]
          ]
      , p [] [ text points ]
      , p [] [ text trait.description ]
      , stringListWithTitle "Same family :" ofSameFamily
      , h5 [] [ text "Effects :" ]
      , Effect.Summary.View.show trait.effects
      ]


show : Maybe Trait -> List Trait -> Html
show hoveredTrait selectedTraits =
  let
    traits =
      case hoveredTrait of
        Nothing ->
          selectedTraits
        Just t ->
          selectedTraits
            |> List.filter (\x -> x /= t)
            |> List.append [t]
  in
    div
      [ class "selected-traits" ]
      (List.map (showOne hoveredTrait selectedTraits) traits)
