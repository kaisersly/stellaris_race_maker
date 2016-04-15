module Government.AllList (show) where


import Html exposing (Html, div, h2, li, text, ul)
import Html.Attributes exposing (class, classList)
import Html.Events exposing (onClick, onMouseEnter, onMouseLeave)


import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Government exposing (Government)
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
      [ text government.name ]


show : Signal.Address Action -> List Ethos -> Maybe Government -> Html
show address selectedEthoses selectedGovernment =
  div
    [ class "all-governments" ]
    [ h2 [] [ text "Government" ]
    , ul [] (List.map (showOne address selectedEthoses selectedGovernment) Government.Data.all)
    ]
