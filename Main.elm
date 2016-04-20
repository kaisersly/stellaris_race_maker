module Main where


import Html exposing (Html)


import Model exposing (Model, initialModel)
import Update exposing (update, Action(NoOp, Init))
import View exposing (show)
import Export
import Import
import Version


port setModelRequests : Signal.Signal Export.IndicesModel


setModelAction : Signal.Signal Action
setModelAction =
  Signal.map Import.fromIndices setModelRequests
  |> Signal.map Init


mb : Signal.Mailbox Action
mb =
  Signal.mailbox NoOp


actionSignal : Signal.Signal Action
actionSignal =
  Signal.mergeMany
    [ mb.signal
    , setModelAction
    ]


modelSignal : Signal.Signal Model
modelSignal =
  Signal.foldp update initialModel actionSignal


main : Signal.Signal Html
main =
  Signal.map (show mb.address) modelSignal


port model : Signal Export.IndicesModel
port model =
  Signal.map Export.asIndices modelSignal
