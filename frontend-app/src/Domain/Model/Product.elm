module Domain.Model.Product exposing (Product, mk)


type alias Product =
    { name : String
    , description : String
    }


mk : String -> Product
mk name =
    Product name defaultDescription


defaultDescription : String
defaultDescription =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In consectetur vel massa a consectetur. Mauris lobortis, nisl sed scelerisque imperdiet, nulla tortor accumsan velit, ac posuere elit tortor ac ante. Sed hendrerit odio in magna lobortis."
