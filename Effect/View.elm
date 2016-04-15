module Effect.View (show) where


import Html exposing (Html, Attribute, span, text)
import Html.Attributes exposing (classList)


import Effect exposing (Effect)


isGood : Int -> Bool -> Bool
isGood amount moreIsBetter =
  (amount > 0 && moreIsBetter) || (amount < 0 && (not moreIsBetter))


amountSpan : Effect -> Html
amountSpan { amount, moreIsBetter, suffix } =
  let
    sign = if amount > 0 then "+" else "-"
  in
    if amount == 0 then
      text ""
    else
      span
        [
          classList
            [ ("green", isGood amount moreIsBetter)
            , ("red", not (isGood amount moreIsBetter))
            ]
        ]
        [ text sign
        , text (toString (abs amount))
        , text suffix
        , text " "
        ]


show : Effect -> Html
show effect =
  span
    []
    [ amountSpan effect
    , text effect.name
    ]
