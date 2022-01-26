module Theme.Navigation exposing (..)

import Colors exposing (..)
import Dict
import Dict.Extra as Dict
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Region as Region
import Helpers exposing (..)
import List.Extra as List
import Route exposing (Route)
import Theme.Layout
import Theme.UI exposing (..)
import Types_ exposing (..)


topLevelNavItems =
    [ ( splat_ "", "Home" )
    , ( splat "learn" [], "Learn" )

    -- , ( splat "discover" [], "Discover" )
    -- , ( splat "build" [], "Build" )
    , ( splat "media" [], "Media" )
    , ( splat "community" [], "Community" )

    -- , ( splat "commercial" [], "Commercial" )
    ]


navigation : Model -> Route -> Element Msg
navigation model currentPath =
    if model.window.width < 1000 then
        navigationMobile model

    else
        navigationDesktop model currentPath


navigationMobile model =
    column [ width fill ]
        [ row [ width fill, Background.color white, padding 30 ]
            [ none

            -- , elmcraftLogo
            , elmcraftLogoText
            , el
                [ width shrink
                , paddingXY 20 10
                , Border.rounded 4
                , Border.width 1
                , Border.color purple
                , onClick ToggleNav
                , alignRight
                , pointer
                ]
              <|
                el [ Font.color charcoal, Font.bold, Font.size 16, Font.center, width fill ]
                    (text <|
                        String.toUpper <|
                            if model.navExpanded then
                                "Close"

                            else
                                "Menu"
                    )
            ]
        , let
            navGroup title ( first, second ) =
                case Dict.get title model.navItemExpanded of
                    Just True ->
                        column [ width fill, padding 10, spacing 20, Font.size 16 ]
                            ([ row [ width fill, onClick <| ToggleNavItem title, pointer ]
                                [ littleTitle [] title
                                , image [ width (px 12), alignRight ] { src = "/images/icons/icon-arrow-collapse.png", description = "menu collapse arrow" }
                                ]
                             ]
                                ++ (first ++ second)
                            )

                    _ ->
                        column [ width fill, padding 10 ]
                            [ row [ width fill, onClick <| ToggleNavItem title, pointer ]
                                [ littleTitle [ Font.color charcoal ] title
                                , image [ width (px 12), alignRight ] { src = "/images/icons/icon-arrow-expand.png", description = "menu collapse arrow" }
                                ]
                            ]

            navItem title route =
                column [ width fill, padding 10 ]
                    [ row [ width fill ]
                        [ -- , link [ Font.color charcoal, Font.size 14, Font.bold ] { url = url, label = text <| String.toUpper title }
                          routeLinkBare [ Font.color charcoal, Font.size 14, Font.bold ] title route
                        ]
                    ]
          in
          if model.navExpanded then
            column [ width fill, spacing 10, padding 20 ]
                (topLevelNavItems
                    |> List.map (\( route, name ) -> navItem name route)
                    |> List.intersperse (el [ width fill, height (px 1), Background.color charcoal ] none)
                )

          else
            none
        ]


navigationDesktop model currentPath =
    let
        open =
            model.navItemExpanded
                |> Dict.find (\k v -> v)
    in
    column [ width fill, Background.color white ]
        [ row
            [ padding 30
            , spaceEvenly
            , Region.navigation
            , width (fill |> maximum Theme.Layout.maxWidth)
            , centerX
            ]
            [ elmcraftLogoText
            , topLevelNavItems
                |> List.map
                    (\( route, title ) ->
                        highlightableLink currentPath route title
                    )
                |> row [ alignRight ]
            ]
        ]


dropdownDesktop model open displayName dropdownItems =
    case open of
        Nothing ->
            none

        Just ( k, v ) ->
            if k == displayName then
                let
                    itemsM =
                        dropdownItems
                            |> List.find
                                (\( name, items ) ->
                                    if name == displayName then
                                        True

                                    else
                                        False
                                )
                in
                case itemsM of
                    Just ( _, items ) ->
                        row
                            [ padding 20
                            , alignLeft
                            , Background.color white
                            , Border.shadow { offset = ( 0, 4 ), size = 0, blur = 4, color = rgba 0 0 0 0.25 }
                            , Border.rounded 5
                            , moveLeft 250
                            ]
                            (asColumns items)

                    Nothing ->
                        none

            else
                none


asColumns ( first, second ) =
    if List.isEmpty second then
        [ first |> List.map desktopHoverItem |> column [ width (px 380), alignTop ] ]

    else
        [ first |> List.map desktopHoverItem |> column [ width (px 380), alignTop ]
        , second |> List.map desktopHoverItem |> column [ width (px 380), alignTop ]
        ]


desktopHoverItem item =
    el
        [ mouseOver [ Background.color purple ]
        , padding 15
        , Border.rounded 5
        , width fill
        ]
        item


groupItem route title description =
    column [ width fill ]
        [ link [ width fill, stopPropagation ]
            { url = toPath route
            , label =
                column [ width fill, spacing 5 ]
                    [ paragraph [ Font.bold ] [ text title ]
                    , paragraph [ Font.color purple ] [ text description ]
                    ]
            }
        ]



-- highlightableLink :
--     PagePath Pages.PathKey
--     -> Directory Pages.PathKey Directory.WithIndex
--     -> String
--     -> Element msg


highlightableLink currentRoute route displayName =
    let
        isHighlighted =
            case toPath route of
                "/" ->
                    toPath currentRoute == "/"

                _ ->
                    String.startsWith (toPath route) (toPath currentRoute)
    in
    routeLinkBare
        [ Font.semiBold
        , Font.size 14
        , padding 20
        , mouseOver [ Font.color purple ]
        , if isHighlighted then
            Font.color purple

          else
            Font.color charcoal
        ]
        (String.toUpper displayName)
        route



-- highlightableLinkIndex : Model -> Maybe ( String, Bool ) -> PagePath Pages.PathKey -> PagePath Pages.PathKey -> String -> Element Msg
-- highlightableLinkIndex model open currentRoute index displayName =
--     let
--         isHighlighted =
--             toPath currentRoute |> String.startsWith (toPath route)
--
--         hoverStyles =
--             open
--                 |> Maybe.map
--                     (\( k, v ) ->
--                         if k == displayName then
--                             [ Font.color purple
--                             , Background.color white
--                             , Border.shadow { offset = ( 0, 4 ), size = 0, blur = 4, color = rgba 0 0 0 0.25 }
--                             ]
--
--                         else
--                             []
--                     )
--                 |> Maybe.withDefault []
--
--         styles =
--             [ Font.size 14
--             , padding 20
--             , Font.semiBold
--             , Border.roundEach { topLeft = 5, topRight = 5, bottomRight = 0, bottomLeft = 0 }
--             ]
--                 ++ hoverStyles
--     in
--     el
--         [ Font.color charcoal
--         , onMouseEnter <| ToggleNavItem displayName
--         , onMouseLeave <| ClearNav
--         , below <|
--             dropdownDesktop model
--                 open
--                 displayName
--                 [-- ( "Discover", itemsDiscover )
--                 ]
--         ]
--     <|
--         routeLinkBare
--             (if isHighlighted then
--                 styles ++ [ Font.color purple ]
--
--              else
--                 styles
--             )
--             (String.toUpper displayName)
--             route
--
-- itemsDiscover =
--     ( [ groupItem (splat_ "placeholder") "Example" "Description"
--       ]
--     , [ groupItem (splat_ "placeholder") "Example" "Description"
--       ]
--     )


externalLink : String -> String -> Element msg
externalLink displayName url =
    link
        [ Font.semiBold
        , Font.color charcoal
        , Font.size 14
        , padding 20
        , mouseOver [ Font.color purple ]
        ]
        { url = url
        , label = text <| String.toUpper displayName
        }


elmcraftLogo =
    link []
        { url = toPath home
        , label =
            image [ width (px 100) ] { src = "/images/elmcraft-logo.png", description = "Elmcraft Logo" }
        }


elmcraftLogoText =
    column [ spacing 5 ]
        [ link [ centerX ]
            { url = toPath home
            , label = image [ width (px 90) ] { src = "/images/elmcraft-logo.png", description = "Elmcraft Logo" }
            }
        , link [ centerX, Font.letterSpacing 3 ]
            { url = toPath home
            , label = el [ Font.size 16 ] (text "elmcraft")
            }
        ]
