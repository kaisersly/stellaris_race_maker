module Main where


import Html exposing (Html)
import Task exposing (Task)


import Model exposing (Model, ExportModel, initialModel, modelToExportModel)
import Update exposing (update, Action(NoOp, Init))
import View exposing (show)
import Export.History
import Import.History
import Version


port path : Signal.Signal String


setModelAction : Signal.Signal Action
setModelAction =
  Signal.map Import.History.fromPath path
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


exportModelSignal : Signal.Signal ExportModel
exportModelSignal =
  Signal.map modelToExportModel modelSignal
    |> Signal.dropRepeats


main : Signal.Signal Html
main =
  Signal.map (show mb.address) modelSignal


port newPath : Signal.Signal String
port newPath =
  Signal.map Export.History.toPath exportModelSignal
