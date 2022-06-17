module Main exposing (main)

import Browser
import Components.Carousel as Carousel
import Components.StarRating as StarRating
import Domain.Model.NumOfReviews as NumOfReviews exposing (NumOfReviews)
import Domain.Model.Price as Price exposing (Price)
import Domain.Model.Product as Product exposing (Product)
import Domain.Model.Rating as Rating exposing (Rating)
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
        [ bike1
        , bike2
        , bike1
        , bike2
        , bike1
        , bike2
        ]
            |> List.filterMap identity
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
        [ viewTitle (products |> List.isEmpty)
        , Carousel.view (products |> List.map viewCard)
        ]


viewTitle : Bool -> Html Msg
viewTitle listIsEmpty =
    div [ class "related-products-title" ]
        [ case listIsEmpty of
            True ->
                text "No related products found!"

            False ->
                text "Related products"
        ]


viewCard : Product -> Html Msg
viewCard product =
    div [ class "card-wrapper" ]
        [ div [ class "product-image-wrapper" ] [ viewImage product.imgUrl ]
        , div [ class "product-price-wrapper" ] [ viewPrice product.price ]
        , div [ class "product-name" ] [ text product.name ]
        , div [ class "product-description" ] [ text product.description ]
        , div [ class "rating-wrapper" ]
            [ div [] [ StarRating.view product.rating ]
            , div [] [ viewReviews product.numOfReviews ]
            ]
        ]


viewImage : String -> Html Msg
viewImage imgUrl =
    img [ width 85, height 60, src imgUrl ] []


viewPrice : Price -> Html Msg
viewPrice price =
    div [ class "product-price-bg" ]
        [ div [ class "product-price" ]
            [ text <| (String.fromFloat <| Price.toFloat price) ++ "€" ]
        ]


viewReviews : NumOfReviews -> Html Msg
viewReviews numOfReviews =
    div [ class "num-of-reviews" ]
        [ text <| "(" ++ String.fromInt (NumOfReviews.toInt numOfReviews) ++ ")" ]



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



-- RESOURCES


bike1 : Maybe Product
bike1 =
    Maybe.map3
        (Product.mk
            "BTWIN"
            "https://p.vitalmtb.com/photos/users/109/photos/56204/s600_origin_primeiro_3Q.jpg"
            "Mtb bambino 5-10 anni ROCKRIDER ST 500 arancione 26\""
        )
        (Price.mk 199.99)
        (Rating.mk 4.6)
        (NumOfReviews.mk 115)


bike2 : Maybe Product
bike2 =
    Maybe.map3
        (Product.mk
            "SUPER"
            "https://purepng.com/public/uploads/large/sports-bicycle-hwk.png"
            "Mtb bambino 9-12 anni ROCKRIDER ST 550 azzurra 28\""
        )
        (Price.mk 249.99)
        (Rating.mk 3.4)
        (NumOfReviews.mk 174)
