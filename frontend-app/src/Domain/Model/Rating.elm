module Domain.Model.Rating exposing (Rating, mk, toFloat)


type Rating
    = Rating Float


mk : Float -> Maybe Rating
mk val =
    if val >= 0 && val <= 5 then
        Just (Rating val)

    else
        Nothing


toFloat : Rating -> Float
toFloat (Rating val) =
    val
