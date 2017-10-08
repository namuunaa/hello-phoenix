module View exposing (..)

import ContactList.View exposing (indexView)
import Common.View exposing (warningMessage, backToHomeLink)
import Contact.View exposing (showContactView)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)
import Model exposing (..)
import Routing exposing (Route(..))

view : Model -> Html Msg
view model =
    section
        []
        [ headerView
        , div []
            [ page model ]
        ]


headerView : Html Msg
headerView =
    header
        [ class "main-header" ]
        [ h1
            []
            [ text "Phoenix and Elm: A real use case" ]
        ]

page : Model -> Html Msg
page model =
    case model.route of
        HomeIndexRoute ->
            indexView model

        NotFoundRoute ->
            notFoundView
            
        ShowContactRoute id ->
            showContactView model

notFoundView : Html Msg
notFoundView =
    warningMessage
        "fa fa-meh-o fa-stack-2x"
        "Page not found"
        backToHomeLink