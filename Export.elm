module Export (IndicesModel, asIndices) where


import Model exposing (Model)
import Ethos exposing (Ethos)
import Ethos.Data
import Government exposing (Government)
import Government.Data
import Trait exposing (Trait)
import Trait.Data


type alias IndicesModel =
  { version : Int
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


asIndices : Model -> IndicesModel
asIndices model =
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
    , ethoses = ethoses
    , government = government
    , traits = traits
    }
