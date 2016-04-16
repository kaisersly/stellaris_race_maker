module Government (Government, GovernmentForm(..), governmentFormToString, isAvailable, isHovered, isSelected) where


import Effect exposing (Effect)
import Ethos exposing (Ethos)


type GovernmentForm
  = Autocracy
  | Oligarchy
  | Democracy


governmentFormToString : GovernmentForm -> String
governmentFormToString form' =
  case form' of
    Autocracy -> "Autocracy"
    Oligarchy -> "Oligarchy"
    Democracy -> "Democracy"


type alias Government =
  { name : String
  , imgUrl : String
  , form' : GovernmentForm
  , description : String
  , rulerTitle : String
  , unlockedIf : List String
  , lockedIf : List String
  , effects : List Effect
  }


isAvailable : List Ethos -> Government -> Bool
isAvailable selectedEthoses government =
  let
    isUnlockedByEthoses =
      if List.isEmpty government.unlockedIf then
        True
      else
        List.any (\e -> List.member e.name government.unlockedIf) selectedEthoses
    isLockedByEthoses =
      List.any (\e -> List.member e.name government.lockedIf) selectedEthoses
  in
    isUnlockedByEthoses && (not isLockedByEthoses)


isHovered : Maybe Government -> Government -> Bool
isHovered hoveredGovernment government =
  case hoveredGovernment of
    Nothing ->
      False
    Just g ->
      government == g

isSelected : Maybe Government -> Government -> Bool
isSelected selectedGovernment government =
  case selectedGovernment of
    Nothing ->
      False
    Just g ->
      government == g
