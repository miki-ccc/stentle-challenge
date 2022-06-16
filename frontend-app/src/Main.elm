module Main exposing (main)

import Browser
import Domain.Model.Product as Product exposing (Product)
import Html exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { relatedProducts : List Product
    }



-- INIT


initModel : Model
initModel =
    { relatedProducts =
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
        [ text "Stentle challenge"
        ]



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initModel
        , view = view
        , update = update
        }
