module Ethos (Ethos, Dichotomy(..), isHovered, isSelected, remainingPoints, dichotomyToString) where


import Effect exposing (Effect)


type Dichotomy
  = CollectivistIndividualist
  | XenophobeXenophile
  | MilitaristPacifist
  | MaterialistSpiritualist


dichotomyToString : Dichotomy -> String
dichotomyToString dichotomy =
  case dichotomy of
    CollectivistIndividualist -> "Collectivist - Individualist"
    XenophobeXenophile -> "Xenophobe - Xenophile"
    MilitaristPacifist -> "Militarist - Pacifist"
    MaterialistSpiritualist -> "Materialist - Spiritualist"


type alias Ethos =
  { dichotomy : Dichotomy
  , name : String
  , points : Int
  , description : String
  , effects : List Effect
  }


countPoints : List Ethos -> Int
countPoints ethoses =
  List.map .points ethoses
    |> List.sum


pointsLimit : Int
pointsLimit = 3


remainingPoints : List Ethos -> Int
remainingPoints ethoses =
  pointsLimit - (countPoints ethoses)


isHovered : Maybe Ethos -> Ethos -> Bool
isHovered hoveredEthos ethos =
  case hoveredEthos of
    Nothing ->
      False
    Just e ->
      ethos == e

isSelected : List Ethos -> Ethos -> Bool
isSelected selectedEthoses ethos =
  List.member ethos selectedEthoses
