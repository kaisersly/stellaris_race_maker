module Effect.Summary (extractEffects, summarize) where


import Dict exposing (Dict)


import Model exposing (Model)
import Effect exposing (Effect)


extractEffects : Model -> List Effect
extractEffects model =
  let
    effectsFromEthoses =
      List.concatMap .effects model.selectedEthoses
    effectsFromGovernment =
      case model.selectedGovernment of
        Nothing ->
          []
        Just g ->
          g.effects
    effectsFromTraits =
      List.concatMap .effects model.selectedTraits
  in
    List.concat
      [ effectsFromEthoses
      , effectsFromGovernment
      , effectsFromTraits
      ]


summarize : List Effect -> List Effect
summarize effects =
  effects
    |> buildEffectDict
    |> Dict.toList
    |> List.map snd


type alias EffectDict = Dict String Effect


buildEffectDict : List Effect -> EffectDict
buildEffectDict effects =
  List.foldl addEffectToDict Dict.empty effects


addEffectToDict : Effect -> EffectDict -> EffectDict
addEffectToDict effect dict =
  let
    effectInDict = Dict.get effect.name dict
  in
    case effectInDict of
      Nothing ->
        Dict.insert effect.name effect dict
      Just e ->
        Dict.insert
          effect.name
          { effect | amount = effect.amount + e.amount }
          dict
