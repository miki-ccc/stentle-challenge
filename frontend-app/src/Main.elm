module Main exposing (main)

import Browser
import Domain.Model.Product as Product exposing (Product)
import Html exposing (..)
import Html.Attributes exposing (class)



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
    div [ class "page-wrapper" ]
        [ viewMainProduct
        , viewAddButton
        , viewRelatedProducts model.relatedProducts
        ]


viewMainProduct : Html Msg
viewMainProduct =
    div [ class "main-product" ]
        []


viewAddButton : Html Msg
viewAddButton =
    div []
        [ button
            [ class "add-button"
            , class "add-button-font"
            ]
            [ text "AGGIUNGI AL CARRELLO" ]
        ]


viewRelatedProducts : List Product -> Html Msg
viewRelatedProducts products =
    div []
        [ viewTitle
        , viewCarousel products
        ]


viewTitle : Html Msg
viewTitle =
    div [ class "related-products-title" ]
        [ text "Related Products" ]


viewCarousel : List Product -> Html Msg
viewCarousel products =
    div [ class "carousel-wrapper" ]
        (products |> List.map (\product -> viewCard product))


viewCard : Product -> Html Msg
viewCard product =
    div [ class "card-wrapper" ]
        [ text product.name ]



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
