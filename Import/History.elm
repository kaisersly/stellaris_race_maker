module Import.History (fromPath) where


import Array
import Regex exposing (HowMany(..), find, regex)
import Result
import String


import Model exposing (Model, initialModel)
import Update exposing (Action(..), update)
import Export.History exposing (IndicesModel)
import Ethos exposing (Ethos)
import Ethos.Data
import Government exposing (Government)
import Government.Data
import Trait exposing (Trait)
import Trait.Data


toInt : String -> Int
toInt str =
  String.toInt str
    |> Result.withDefault -1


findInPath : String -> String -> List String
findInPath path expr =
  let
    regexp = regex expr
    matches = find All regexp path
  in
    List.concatMap .submatches matches
      |> List.filter (\x -> x /= Nothing)
      |> List.map (Maybe.withDefault "")


version : String -> Int
version path =
  let
    submatches = findInPath path "version=([0-9]*)"
  in
    List.map toInt submatches
      |> List.head
      |> Maybe.withDefault -1



name : String -> String
name path =
  let
    submatches = findInPath path "name=\"(.*)\""
  in
    List.head submatches
      |> Maybe.withDefault ""


ethoses : String -> List Int
ethoses path =
  let
    submatches = findInPath path "ethoses=([0-9|,]*)"
  in
    List.concatMap (String.split ",") submatches
      |> List.map toInt


government : String -> Maybe Int
government path =
  let
    submatches = findInPath path "government=([0-9]*)"
  in
    List.map toInt submatches
      |> List.head


traits : String -> List Int
traits path =
  let
    submatches = findInPath path "traits=([0-9|,]*)"
  in
    List.concatMap (String.split ",") submatches
      |> List.map toInt


buildIndicesModel : String -> IndicesModel
buildIndicesModel path =
  { version = version path
  , name = name path
  , ethoses = ethoses path
  , government = government path
  , traits = traits path
  }

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


setName : String -> Model -> Model
setName name model =
  update (SetName name) model


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


fromIndicesModel : IndicesModel -> Model
fromIndicesModel indicesModel =
  let
    name = indicesModel.name
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
      |> setName name
      |> setEthoses ethoses
      |> setGovernment government
      |> setTraits traits
      |> checkVersion indicesModel.version


fromPath : String -> Model
fromPath path =
  if path == "" then
    initialModel
  else
    buildIndicesModel path
      |> fromIndicesModel
