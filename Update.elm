module Update (Action(..), update) where


import Model exposing (Model)
import Ethos exposing (Ethos)
import Government exposing (Government, GovernmentForm)
import Trait exposing (Trait, Family(None))


ethosesAreValid : List Ethos -> Bool
ethosesAreValid ethoses =
  Ethos.remainingPoints ethoses >= 0


enforceGovernmentIsValid : Model -> Model
enforceGovernmentIsValid model =
  case model.selectedGovernment of
    Nothing ->
      model
    Just g ->
      if Government.isAvailable model.selectedEthoses g then
        model
      else
        { model | selectedGovernment = Nothing }


traitsAreValid : List Trait -> Bool
traitsAreValid traits =
  (Trait.remainingPoints traits >= 0) && (Trait.remainingTraits traits >= 0)


type Action
  = NoOp
  | Init Model
  | SelectEthos Ethos
  | DeselectEthos Ethos
  | HoverEthos Ethos
  | DehoverEthos
  | SelectGovernment Government
  | DeselectGovernment
  | HoverGovernment Government
  | DehoverGovernment
  | HoverGovernmentForm GovernmentForm
  | DehoverGovernmentForm
  | SelectTrait Trait
  | DeselectTrait Trait
  | HoverTrait Trait
  | DehoverTrait


update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model
    Init newModel ->
      newModel
    SelectEthos ethos ->
      let
        newEthoses =
          List.filter (\x -> x.dichotomy /= ethos.dichotomy) model.selectedEthoses
            |> List.append [ ethos ]
        newModel =
          if ethosesAreValid newEthoses then
            { model | selectedEthoses = newEthoses }
          else
            model
      in
        enforceGovernmentIsValid newModel
    DeselectEthos ethos ->
      let
        newEthoses = List.filter (\x -> x /= ethos) model.selectedEthoses
        newModel = { model | selectedEthoses = newEthoses }
      in
        enforceGovernmentIsValid newModel
    HoverEthos ethos ->
      { model | hoveredEthos = Just ethos }
    DehoverEthos ->
      { model | hoveredEthos = Nothing }
    SelectGovernment government ->
      let
        newModel =
          { model | selectedGovernment = Just government }
      in
        enforceGovernmentIsValid newModel
    DeselectGovernment ->
      { model | selectedGovernment = Nothing }
    HoverGovernment government ->
      { model | hoveredGovernment = Just government }
    DehoverGovernment ->
      { model | hoveredGovernment = Nothing }
    HoverGovernmentForm form' ->
      { model | hoveredGovernmentForm = Just form' }
    DehoverGovernmentForm ->
      { model | hoveredGovernmentForm = Nothing }
    SelectTrait trait ->
      let
        newTraits =
          if trait.family == None then
            [trait] ++ model.selectedTraits
          else
             List.filter (\x -> x.family /= trait.family) model.selectedTraits
              |> flip (++) [trait]
      in
        if traitsAreValid newTraits then
          { model | selectedTraits = newTraits }
        else
          model
    DeselectTrait trait ->
      let
        newTraits =
          List.filter (\x -> x /= trait) model.selectedTraits
      in
        { model | selectedTraits = newTraits }
    HoverTrait trait ->
      { model | hoveredTrait = Just trait }
    DehoverTrait ->
      { model | hoveredTrait = Nothing }
