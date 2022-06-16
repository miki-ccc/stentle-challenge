module Domain.Model.Product exposing (Product, mk)

import Domain.Model.NumOfReviews as NumOfReviews exposing (NumOfReviews)
import Domain.Model.Price as Price exposing (Price)
import Domain.Model.Rating as Rating exposing (Rating)


type alias Product =
    { name : String
    , imgUrl : String
    , description : String
    , price : Price
    , rating : Rating
    , numOfReviews : NumOfReviews
    }


mk : String -> String -> String -> Price -> Rating -> NumOfReviews -> Product
mk name imgUrl description price rating numOfReviews =
    Product
        name
        imgUrl
        description
        price
        rating
        numOfReviews
