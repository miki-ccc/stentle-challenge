module Domain.Model.Product exposing (Product, mk)

import Domain.Model.NumOfReviews as NumOfReviews exposing (NumOfReviews)
import Domain.Model.Price as Price exposing (Price)


type alias Product =
    { name : String
    , imgUrl : String
    , description : String
    , price : Price
    , rating : Int
    , numOfReviews : NumOfReviews
    }


mk : String -> String -> String -> Price -> NumOfReviews -> Product
mk name imgUrl description price numOfReviews =
    Product
        name
        imgUrl
        description
        price
        3
        numOfReviews
