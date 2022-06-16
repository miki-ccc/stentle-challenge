module Domain.Model.NumOfReviews exposing (NumOfReviews, mk, toInt)


type NumOfReviews
    = NumOfReviews Int


mk : Int -> Maybe NumOfReviews
mk val =
    if val >= 0 then
        Just (NumOfReviews val)

    else
        Nothing


toInt : NumOfReviews -> Int
toInt (NumOfReviews val) =
    val
