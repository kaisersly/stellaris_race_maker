module View (show) where


import Html exposing (Html, div, h2, text)
import Html.Attributes exposing (class)


import Model exposing (Model)
import Update exposing (Action(..))
import Effect.Summary
import Effect.Summary.View
import Ethos.AllList
import Ethos.SelectedList
import Government.AllList
import Government.SelectedList
import Trait.AllList
import Trait.SelectedList


show : Signal.Address Action -> Model -> Html
show address model =
  let
    effects = Effect.Summary.extractEffects model
    warning =
      case model.warning of
        Nothing ->
          text ""
        Just str ->
          div
            [ class "alert alert-warning" ]
            [ text str ]
  in
    div
      [ class "container-fluid" ]
      [ warning
      , div
          [ class "row" ]
          [ div
              [ class "col-sm-5" ]
              [ Ethos.AllList.show address model.selectedEthoses ]
          , div
              [ class "col-sm-7" ]
              [ Ethos.SelectedList.show model.hoveredEthos model.selectedEthoses ]
          ]
      , div
          [ class "row" ]
          [ div
              [ class "col-sm-5" ]
              [ Government.AllList.show address model.selectedEthoses model.selectedGovernment ]
          , div
              [ class "col-sm-7" ]
              [ Government.SelectedList.show model.hoveredGovernmentForm model.hoveredGovernment model.selectedGovernment ]
          ]
      , div
          [ class "row" ]
          [ div
              [ class "col-sm-5" ]
              [ Trait.AllList.show address model.hoveredTrait model.selectedTraits ]
          , div
              [ class "col-sm-7" ]
              [ Trait.SelectedList.show model.hoveredTrait model.selectedTraits ]
          ]
      , div
          [ class "row" ]
          [ div
            [ class "col-sm-12" ]
            [ h2 [] [ text "Summary" ]
            , Effect.Summary.View.show effects
            ]
        ]
      ]
