module Main exposing (main)

import Browser
import Domain.Model.Product as Product exposing (Product)
import Html exposing (..)
import Html.Attributes exposing (class, height, src, width)



-- MODEL


type alias Model =
    { relatedProducts : List Product
    }



-- INIT


initModel : Model
initModel =
    { relatedProducts =
        [ Product.mk "product 1" images.clock
        , Product.mk "product 2" images.laptop
        , Product.mk "product 3" images.camera
        , Product.mk "product 4" images.strawberries
        , Product.mk "product 5" images.laptop
        , Product.mk "product 6" images.clock
        , Product.mk "product 7" images.strawberries
        , Product.mk "product 8" images.camera
        , Product.mk "product 9" images.clock
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
        [ div [] [ img [ width 110, height 90, src product.imgUrl ] [] ]
        , div [] [ text "price" ]
        , div [] [ text "name" ]
        , div [] [ text "description" ]
        , div [] [ text "review" ]
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



-- IMAGES


images =
    { clock = "https://i.picsum.photos/id/357/3888/2592.jpg?hmac=322FsZ93_k9v7NNFeCTlqk_gobPP_1mYJIQwk7GxjMc"
    , laptop = "https://i.picsum.photos/id/2/5616/3744.jpg?hmac=l1XcSPFigtRLcO2F6Li-t17EIeylkWH94Oowb4vzApk"
    , camera = "https://i.picsum.photos/id/250/4928/3264.jpg?hmac=4oIwzXlpK4KU3wySTnATICCa4H6xwbSGifrxv7GafWU"
    , strawberries = "https://i.picsum.photos/id/1080/6858/4574.jpg?hmac=qMYBjROs2Wu589QQXRAYsxDJu4ZuRQ4PKDpb3x_Oouw"
    }
