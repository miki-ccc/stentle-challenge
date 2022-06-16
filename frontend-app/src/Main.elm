module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { value : Int
    }



-- INIT


initialModel : Model
initialModel =
    { value = 0
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , text (String.fromInt model.value)
        , button [ onClick Increment ] [ text "+" ]
        ]



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            { model | value = model.value + 1 }

        Decrement ->
            { model | value = model.value - 1 }



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
