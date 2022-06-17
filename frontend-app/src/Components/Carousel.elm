module Components.Carousel exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class)


view : List (Html msg) -> Html msg
view items =
    div [ class "carousel-wrapper" ] items
