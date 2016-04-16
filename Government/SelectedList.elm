module Government.SelectedList (show) where


import Html exposing (Html, br, div, h4, h5, li, p, small, text, ul)
import Html.Attributes exposing (class, classList)


import Effect exposing (Effect)
import Effect.Summary.View
import Government exposing (Government, GovernmentForm)
import Government.Data


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
        , ("notselected", not (Government.isSelected selectedGovernment government))
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


showGovernmentForm : GovernmentForm -> Html
showGovernmentForm form' =
  div []
    [ h4 [] [ text (Government.governmentFormToString form') ]
    , p [] [ text (Government.Data.governmentForm form') ]
    ]

show : Maybe GovernmentForm -> Maybe Government -> Maybe Government -> Html
show hoveredGovernmentForm hoveredGovernment selectedGovernment =
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
    case hoveredGovernmentForm of
      Nothing ->
        div
          [ class "selected-governments" ]
          (List.map (showOne hoveredGovernment selectedGovernment) governments)
      Just f ->
        div
          [ class "hovered-government-form"]
          [ showGovernmentForm f ]
