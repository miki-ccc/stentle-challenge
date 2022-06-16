module Domain.Model.Product exposing (Product, mk)

import Domain.Model.Price as Price exposing (Price)


type alias Product =
    { name : String
    , imgUrl : String
    , description : String
    , price : Price
    , rating : Int
    , numOfReviews : Int
    }


mk : String -> String -> String -> Price -> Product
mk name imgUrl description price =
    Product
        name
        imgUrl
        description
        price
        3
        155
