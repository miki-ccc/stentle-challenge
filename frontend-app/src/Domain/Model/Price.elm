module Domain.Model.Price exposing (Price, mk)


type Price
    = Price Float


mk : Float -> Maybe Price
mk val =
    if val > 0 then
        Just (Price val)

    else
        Nothing
