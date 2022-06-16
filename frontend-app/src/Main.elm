module Main exposing (main)

import Browser
import Domain.Model.Product as Product exposing (Product)
import Html exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { value : Int
    , relatedProducts : List Product
    }



-- INIT


initModel : Model
initModel =
    { value = 0
    , relatedProducts =
        [ Product.mk "product 1"
        , Product.mk "product 2"
        , Product.mk "product 3"
        , Product.mk "product 4"
        , Product.mk "product 5"
        ]
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
        { init = initModel
        , view = view
        , update = update
        }
