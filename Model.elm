module Model (ExportModel, Model, initialModel, modelToExportModel) where


import Ethos exposing (Ethos)
import Government exposing (Government, GovernmentForm)
import Trait exposing (Trait)
import Version


type alias Model =
  { version : Int
  , name : String
  , warning : Maybe String
  , selectedEthoses : List Ethos
  , hoveredEthos : Maybe Ethos
  , selectedGovernment : Maybe Government
  , hoveredGovernment : Maybe Government
  , hoveredGovernmentForm : Maybe GovernmentForm
  , selectedTraits : List Trait
  , hoveredTrait : Maybe Trait
  }


type alias ExportModel =
  { version : Int
  , name : String
  , selectedEthoses : List Ethos
  , selectedGovernment : Maybe Government
  , selectedTraits : List Trait
  }


modelToExportModel : Model -> ExportModel
modelToExportModel model =
  { version = model.version
  , name = model.name
  , selectedEthoses = model.selectedEthoses
  , selectedGovernment = model.selectedGovernment
  , selectedTraits = model.selectedTraits
  }


initialModel : Model
initialModel =
  { version = Version.get
  , name = ""
  , warning = Nothing
  , selectedEthoses = []
  , hoveredEthos = Nothing
  , selectedGovernment = Nothing
  , hoveredGovernment = Nothing
  , hoveredGovernmentForm = Nothing
  , selectedTraits = []
  , hoveredTrait = Nothing
  }
