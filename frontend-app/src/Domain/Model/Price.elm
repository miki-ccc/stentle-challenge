module Domain.Model.Price exposing (Price, mk, toFloat)


type Price
    = Price Float


mk : Float -> Maybe Price
mk val =
    if val > 0 then
        Just (Price val)

    else
        Nothing


toFloat : Price -> Float
toFloat (Price val) =
    val
