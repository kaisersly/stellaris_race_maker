module Export.History (IndicesModel, toPath) where


import String


import Model exposing (ExportModel)
import Update exposing (Action(..))
import Ethos exposing (Ethos)
import Ethos.Data
import Government exposing (Government)
import Government.Data
import Trait exposing (Trait)
import Trait.Data


type alias IndicesModel =
  { version : Int
  , name : String
  , ethoses : List Int
  , government : Maybe Int
  , traits : List Int
  }


indexInList : List a -> a -> Maybe Int
indexInList list a =
  List.indexedMap (,) list
    |> List.filter (\(i, x) -> x == a)
    |> List.map (\(i, x) -> i)
    |> List.head


buildIndicesModel : ExportModel -> IndicesModel
buildIndicesModel model =
  let
    ethoses =
      List.map (indexInList Ethos.Data.all) model.selectedEthoses
        |> List.filter (\x -> x /= Nothing)
        |> List.map (Maybe.withDefault 0)
        |> List.sort
    government =
      case model.selectedGovernment of
        Nothing ->
          Nothing
        Just g ->
          indexInList Government.Data.all g
    traits =
      List.map (indexInList Trait.Data.all) model.selectedTraits
        |> List.filter (\x -> x /= Nothing)
        |> List.map (Maybe.withDefault 0)
        |> List.sort
  in
    { version = model.version
    , name = model.name
    , ethoses = ethoses
    , government = government
    , traits = traits
    }


version : IndicesModel -> String
version { version } =
  "version=" ++ (toString version)


name : IndicesModel -> String
name { name } =
  "name=" ++ (toString name)


ethoses : IndicesModel -> String
ethoses { ethoses } =
  let
    ethosesStr =
      List.map toString ethoses
        |> String.join ","
  in
    "ethoses=" ++ ethosesStr


government : IndicesModel -> String
government { government } =
  let
    governmentStr =
      case government of
        Nothing ->
          ""
        Just g ->
          toString g
  in
    "government=" ++ governmentStr


traits : IndicesModel -> String
traits { traits } =
  let
    traitsStr =
      List.map toString traits
        |> String.join ","
  in
    "traits=" ++ traitsStr


toPath : ExportModel -> String
toPath model =
  let
    indicesModel = buildIndicesModel model
    queryString =
      String.join "&"
        [ version indicesModel
        , name indicesModel
        , ethoses indicesModel
        , government indicesModel
        , traits indicesModel
        ]
  in
    "?" ++ queryString
