module Import (fromIndices) where


import Array


import Model exposing (Model, initialModel)
import Update exposing (Action(..), update)
import Export exposing (IndicesModel)
import Ethos exposing (Ethos)
import Ethos.Data
import Government exposing (Government)
import Government.Data
import Trait exposing (Trait)
import Trait.Data


filterNothings : List (Maybe a) -> List a
filterNothings list =
  List.foldl
    (\current acc ->
      case current of
        Nothing ->
          acc
        Just x ->
          x :: acc
    )
    []
    list


setEthoses : List Ethos -> Model -> Model
setEthoses ethoses model =
  let
    actions =
      List.map SelectEthos ethoses
  in
    List.foldl update model actions


setGovernment : Maybe Government -> Model -> Model
setGovernment maybeGovernment model =
  case maybeGovernment of
    Nothing ->
      model
    Just g ->
      update (SelectGovernment g) model


setTraits : List Trait -> Model -> Model
setTraits traits model =
  let
    actions =
      List.map SelectTrait traits
  in
    List.foldl update model actions


checkVersion : Int -> Model -> Model
checkVersion version model =
  if model.version == version then
    model
  else
    { model | warning = Just "The version of this race does not match the current version of this app" }


fromIndices : IndicesModel -> Model
fromIndices indicesModel =
  let
    ethosesArray = Array.fromList Ethos.Data.all
    ethoses =
      List.map (flip Array.get ethosesArray) indicesModel.ethoses
        |> filterNothings
    governmentsArray = Array.fromList Government.Data.all
    government =
      case indicesModel.government of
        Nothing ->
          Nothing
        Just i ->
          Array.get i governmentsArray
    traitsArray = Array.fromList Trait.Data.all
    traits =
      List.map (flip Array.get traitsArray) indicesModel.traits
        |> filterNothings
  in
    initialModel
      |> setEthoses ethoses
      |> setGovernment government
      |> setTraits traits
      |> checkVersion indicesModel.version
