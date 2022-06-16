module Domain.Model.Product exposing (Product, mk)


type alias Product =
    { name : String
    , imgUrl : String
    , description : String
    , rating : Int
    , numOfReviews : Int
    }


mk : String -> String -> Product
mk name imgUrl =
    Product name imgUrl defaultDescription 3 155


defaultDescription : String
defaultDescription =
    "Mtb bambino 9-12 anni ROCKRIDER ST 500 arancione 26"
