module Trait (Trait, Family(..), remainingPoints, isHovered, isSelected, remainingTraits, ofSameFamily) where


import Effect exposing (Effect)
import Ethos exposing (Ethos)


type Family
  = ExtremelyNonAdaptive
  | CharismaticRepugnant
  | CommunalSolitary
  | EnduringVenerable
  | NaturalEngineersPhysicistsSociologists
  | NomadicSedentary
  | QuickSlowLearners
  | RapidSlowBreeders
  | VeryStrongWeak
  | None


type alias Trait =
  { family : Family
  , name : String
  , description : String
  , points : Int
  , effects : List Effect
  }


traitsLimit : Int
traitsLimit = 4


remainingTraits : List Trait -> Int
remainingTraits traits =
  traitsLimit - (List.length traits)


countPoints : List Trait -> Int
countPoints traits =
  List.map .points traits
    |> List.sum


pointsLimit : Int
pointsLimit = 2


remainingPoints : List Trait -> Int
remainingPoints traits =
  pointsLimit - (countPoints traits)


isHovered : Maybe Trait -> Trait -> Bool
isHovered hoveredTrait trait =
  case hoveredTrait of
    Nothing ->
      False
    Just t ->
      trait == t

isSelected : List Trait -> Trait -> Bool
isSelected selectedTraits trait =
  List.member trait selectedTraits


ofSameFamily : List Trait -> Trait -> List String
ofSameFamily traits trait =
  List.filter (\x -> x.family == trait.family) traits
    |> List.filter (\x -> x.family /= None)
    |> List.filter (\x -> x /= trait)
    |> List.map .name
