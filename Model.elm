module Model (Model, initialModel) where


import Ethos exposing (Ethos)
import Government exposing (Government, GovernmentForm)
import Trait exposing (Trait)
import Version


type alias Model =
  { version : Int
  , warning : Maybe String
  , selectedEthoses : List Ethos
  , hoveredEthos : Maybe Ethos
  , selectedGovernment : Maybe Government
  , hoveredGovernment : Maybe Government
  , hoveredGovernmentForm : Maybe GovernmentForm
  , selectedTraits : List Trait
  , hoveredTrait : Maybe Trait
  }


initialModel : Model
initialModel =
  { version = Version.get
  , warning = Nothing
  , selectedEthoses = []
  , hoveredEthos = Nothing
  , selectedGovernment = Nothing
  , hoveredGovernment = Nothing
  , hoveredGovernmentForm = Nothing
  , selectedTraits = []
  , hoveredTrait = Nothing
  }
