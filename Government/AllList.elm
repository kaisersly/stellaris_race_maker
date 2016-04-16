module Government.AllList (show) where


import Html exposing (Html, div, h2, h4, img, li, p, text, ul)
import Html.Attributes exposing (class, classList, src)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)


import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Government exposing (Government, GovernmentForm(..))
import Government.Data


showOne : Signal.Address Action -> List Ethos -> Maybe Government -> Government -> Html
showOne address selectedEthoses selectedGovernment government =
  let
    isSelected = Government.isSelected selectedGovernment government
    isAvailable = Government.isAvailable selectedEthoses government
    onClickAction =
      if isSelected then
        DeselectGovernment
      else if (not isAvailable) then
        NoOp
      else
        SelectGovernment government
  in
    li
      [ classList
        [ ("government", True)
        , ("unavailable", not isAvailable)
        , ("selected", isSelected)
        ]
      , onMouseEnter address (HoverGovernment government)
      , onMouseLeave address DehoverGovernment
      , onClick address onClickAction
      ]
      [ img [ src government.imgUrl ] []
      , p [] [ text government.name ]
      ]


showGovernmentForm : Signal.Address Action -> GovernmentForm -> Html
showGovernmentForm address form' =
  h4
    [ class "government-form"
    , onMouseEnter address (HoverGovernmentForm form')
    , onMouseLeave address DehoverGovernmentForm
    ]
    [ text (Government.governmentFormToString form') ]


show : Signal.Address Action -> List Ethos -> Maybe Government -> Html
show address selectedEthoses selectedGovernment =
  let
    autocracies = List.filter (\x -> x.form' == Autocracy) Government.Data.all
    oligarchies = List.filter (\x -> x.form' == Oligarchy) Government.Data.all
    democracies = List.filter (\x -> x.form' == Democracy) Government.Data.all
  in
    div
      [ class "all-governments row" ]
      [ h2 [] [ text "Government" ]
      , div
          [ class "col-sm-4" ]
          [ showGovernmentForm address Autocracy
          , ul [] (List.map (showOne address selectedEthoses selectedGovernment) autocracies)
          ]
      , div
          [ class "col-sm-4" ]
          [ showGovernmentForm address Oligarchy
          , ul [] (List.map (showOne address selectedEthoses selectedGovernment) oligarchies)
          ]
      , div
          [ class "col-sm-4" ]
          [ showGovernmentForm address Democracy
          , ul [] (List.map (showOne address selectedEthoses selectedGovernment) democracies)
          ]
      ]
