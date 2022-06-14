-- #region elm imports


module Frontend exposing (..)

import Browser
import Html exposing (Html, text)
import Html.Attributes exposing (style)
import Material.Card exposing (Button)
import Material.Drawer.Dismissible as DismissibleDrawer
import Material.Fab as Fab
import Material.Icon as Icon
import Material.List as List
import Material.List.Item as ListItem
import Material.TopAppBar as TopAppBar
import Material.Typography as Typography



-- #endregion


type alias Model =
    { text : String
    , drawerOpen : Bool
    , selectedIndex : Int
    }


type Msg
    = Assign String
    | FabClicked
    | ToggleDrawer
    | CloseDrawer
    | SetSelectedIndex Int


initialModel : Model
initialModel =
    { text = "hello world!"
    , drawerOpen = True
    , selectedIndex = 0
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Assign input ->
            { model | text = input }

        FabClicked ->
            { model | text = "clicked!" }

        ToggleDrawer ->
            { model | drawerOpen = not model.drawerOpen }

        CloseDrawer ->
            { model | drawerOpen = False }

        SetSelectedIndex index ->
            { model | selectedIndex = index }


view : Model -> Html Msg
view model =
    Html.div [ Typography.headline1 ]
        [ Fab.fab
            (Fab.config
                |> Fab.setOnClick FabClicked
                |> Fab.setAttributes
                    [ style "position" "fixed"
                    , style "bottom" "2rem"
                    , style "right" "2rem"
                    ]
            )
            (Fab.icon "add_shopping_cart")
        , text model.text
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , update = update
        , view = view
        }
