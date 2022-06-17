module Components.StarRating exposing (view)

import Domain.Model.Rating as Rating exposing (Rating)
import Html exposing (Html, div)
import Svg
import Svg.Attributes



-- PUBLIC


view : Rating -> Html msg
view rating =
    div []
        [ viewStar <| calculateFilling 1 rating
        , viewStar <| calculateFilling 2 rating
        , viewStar <| calculateFilling 3 rating
        , viewStar <| calculateFilling 4 rating
        , viewStar <| calculateFilling 5 rating
        ]



-- COLORS


colors =
    { background = "#bfbfbf"
    , filling = "#ffea00"
    , stroke = "#c7a900"
    }



-- PRIVATE


calculateFilling : Float -> Rating -> Int
calculateFilling star rating =
    let
        delta =
            Rating.toFloat rating - star + 1
    in
    if delta >= 1 then
        100

    else if delta <= 0 then
        0

    else
        round (delta * 100)


viewStar : Int -> Html msg
viewStar fillingPercent =
    case fillingPercent of
        0 ->
            emptyStar

        100 ->
            fullStar

        _ ->
            partialStar fillingPercent


emptyStar : Html msg
emptyStar =
    starPolygon
        (Svg.Attributes.fill colors.background)
        Nothing


fullStar : Html msg
fullStar =
    starPolygon
        (Svg.Attributes.fill colors.filling)
        Nothing


partialStar : Int -> Html msg
partialStar percent =
    let
        percentStr =
            String.fromInt percent

        gradientId =
            "perc-" ++ percentStr
    in
    starPolygon
        (Svg.Attributes.fill <| "url(#" ++ gradientId ++ ")")
        (Just <|
            Svg.linearGradient
                [ Svg.Attributes.id gradientId ]
                [ Svg.stop [ Svg.Attributes.offset "0%", Svg.Attributes.stopColor colors.filling ] []
                , Svg.stop [ Svg.Attributes.offset (percentStr ++ "%"), Svg.Attributes.stopColor colors.filling ] []
                , Svg.stop [ Svg.Attributes.offset (percentStr ++ "%"), Svg.Attributes.stopColor colors.background ] []
                , Svg.stop [ Svg.Attributes.offset "100%", Svg.Attributes.stopColor colors.background ] []
                ]
        )


starPolygon : Svg.Attribute msg -> Maybe (Svg.Svg msg) -> Html msg
starPolygon fillAttribute mGradient =
    Svg.svg
        [ Svg.Attributes.width "10"
        , Svg.Attributes.height "10"
        ]
        ([ Svg.polygon
            [ fillAttribute
            , Svg.Attributes.stroke colors.stroke
            , Svg.Attributes.strokeWidth "0.4px"
            , Svg.Attributes.points "0,3.7 3.7,3.7 5,0 6.4,3.7 10,3.7 7,6 8.5,10 5,7.5 1.5,10 3,6"
            ]
            []
         ]
            ++ (case mGradient of
                    Just gradient ->
                        [ gradient ]

                    Nothing ->
                        []
               )
        )
