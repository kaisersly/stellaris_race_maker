module Government.SelectedList (show) where


import Html exposing (Html, br, div, h4, h5, li, p, small, text, ul)
import Html.Attributes exposing (class, classList)


import Effect exposing (Effect)
import Effect.Summary.View
import Government exposing (Government)


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


showOne : Maybe Government -> Maybe Government -> Government -> Html
showOne hoveredGovernment selectedGovernment government =
  div
    [ classList
        [ ("government", True)
        , ("selected", Government.isSelected selectedGovernment government)
        , ("hovered", Government.isHovered hoveredGovernment government)
        ]
    ]
    [ h4 []
        [ text government.name
        , br [] []
        , small [] [ text government.rulerTitle ]
        ]
    , p [] [ text government.description ]
    , stringListWithTitle "Unlocked by :" government.unlockedIf
    , stringListWithTitle "Locked by :" government.lockedIf
    , h5 [] [ text "Effects :" ]
    , Effect.Summary.View.show government.effects
    ]


show : Maybe Government -> Maybe Government -> Html
show hoveredGovernment selectedGovernment =
  let
    governments =
      case (hoveredGovernment, selectedGovernment) of
        (Nothing, Nothing) ->
          []
        (Just g, Nothing) ->
          [g]
        (Nothing, Just g) ->
          [g]
        (Just h, Just s) ->
          if h == s then
            [s]
          else
            [h, s]
  in
    div
      [ class "selected-governments" ]
      (List.map (showOne hoveredGovernment selectedGovernment) governments)
