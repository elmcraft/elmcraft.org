module Templates.Navigation exposing (..)

import Colors exposing (..)
import Dict
import Dict.Extra as Dict
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (..)
import Element.Font as Font
import Element.Region as Region
import List.Extra as List
import Pages
import Pages.Directory as Directory exposing (Directory)
import Pages.ImagePath
import Pages.PagePath as PagePath exposing (PagePath)
import Palette
import Templates.UI exposing (..)
import Types exposing (..)


itemsDiscover =
    ( [ groupItem Pages.pages.placeholder "Example" "Description"
      ]
    , [ groupItem Pages.pages.placeholder "Example" "Description"
      ]
    )


navigation : Model -> PagePath Pages.PathKey -> Element Msg
navigation model currentPath =
    if model.window.width < 1000 then
        navigationMobile model

    else
        navigationDesktop model currentPath


navigationMobile model =
    column [ width fill ]
        [ row [ width fill, Background.color white, padding 30 ]
            [ elmcraftLogo
            , el
                [ width shrink
                , paddingXY 20 10
                , Border.rounded 4
                , Border.width 1
                , Border.color elmTeal
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

            navItem title url =
                column [ width fill, padding 10 ]
                    [ row [ width fill ]
                        [ link [ Font.color charcoal, Font.size 14, Font.bold ] { url = url, label = text <| String.toUpper title }
                        ]
                    ]
          in
          if model.navExpanded then
            column [ width fill, spacing 10, padding 20 ]
                ([ -- navGroup "Discover" itemsDiscover
                   navItem "Discover" (asPath Pages.pages.discover.index)
                 , navItem "Build" (asPath Pages.pages.discover.index)
                 , navItem "Media" (asPath Pages.pages.discover.index)
                 , navItem "Community" (asPath Pages.pages.discover.index)
                 ]
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
            , width (fill |> maximum 1440)
            , centerX
            ]
            [ elmcraftLogo
            , row [ alignRight ]
                [ highlightableLink currentPath Pages.pages.discover.directory "Discover"
                , highlightableLink currentPath Pages.pages.discover.directory "Build"
                , highlightableLink currentPath Pages.pages.discover.directory "Media"
                , highlightableLink currentPath Pages.pages.discover.directory "Community"

                -- , externalLink "Github" "https://github.com/elmcraft/elmcraft.org"
                -- , spacer 20
                ]
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
        [ mouseOver [ Background.color elmTeal ]
        , padding 15
        , Border.rounded 5
        , width fill
        ]
        item


groupItem page title description =
    column [ width fill ]
        [ link [ width fill, stopPropagation ]
            { url = asPath page
            , label =
                column [ width fill, spacing 5 ]
                    [ paragraph [ Font.bold ] [ text title ]
                    , paragraph [ Font.color elmTeal ] [ text description ]
                    ]
            }
        ]


highlightableLink :
    PagePath Pages.PathKey
    -> Directory Pages.PathKey Directory.WithIndex
    -> String
    -> Element msg
highlightableLink currentPath linkDirectory displayName =
    let
        isHighlighted =
            currentPath |> Directory.includes linkDirectory
    in
    link
        [ Font.semiBold
        , Font.size 14
        , padding 20
        , mouseOver [ Font.color elmTeal ]
        , if isHighlighted then
            Font.color elmTeal

          else
            Font.color charcoal
        ]
        -- @TODO need to fix the URL generation here, it's camelcase instead of original?
        -- highlightableLinkIndex fixes this by using index but unsure if correct...
        { url =
            linkDirectory
                -- |> Debug.log ("linkdirectory for " ++ displayName)
                |> Directory.indexPath
                -- |> Debug.log "dir indexPath"
                |> PagePath.toString

        -- |> Debug.log "pagepath tostring"
        , label = text <| String.toUpper displayName
        }


highlightableLinkIndex : Model -> Maybe ( String, Bool ) -> PagePath Pages.PathKey -> PagePath Pages.PathKey -> String -> Element Msg
highlightableLinkIndex model open currentPath index displayName =
    let
        isHighlighted =
            currentPath == index

        hoverStyles =
            open
                |> Maybe.map
                    (\( k, v ) ->
                        if k == displayName then
                            [ Font.color elmTeal
                            , Background.color white
                            , Border.shadow { offset = ( 0, 4 ), size = 0, blur = 4, color = rgba 0 0 0 0.25 }
                            ]

                        else
                            []
                    )
                |> Maybe.withDefault []

        styles =
            [ Font.size 14
            , padding 20
            , Font.semiBold
            , Border.roundEach { topLeft = 5, topRight = 5, bottomRight = 0, bottomLeft = 0 }
            ]
                ++ hoverStyles
    in
    el
        [ Font.color charcoal
        , onMouseEnter <| ToggleNavItem displayName
        , onMouseLeave <| ClearNav
        , below <|
            dropdownDesktop model
                open
                displayName
                [ ( "Discover", itemsDiscover )
                ]
        ]
    <|
        link
            (if isHighlighted then
                styles ++ [ Font.color elmTeal ]

             else
                styles
            )
            { url = index |> PagePath.toString
            , label =
                text <| String.toUpper displayName
            }


externalLink : String -> String -> Element msg
externalLink displayName url =
    link
        [ Font.semiBold
        , Font.color charcoal
        , Font.size 14
        , padding 20
        , mouseOver [ Font.color elmTeal ]
        ]
        { url = url
        , label = text <| String.toUpper displayName
        }


elmcraftLogo =
    link []
        { url = "/"
        , label =
            image [ width (px 180) ] { src = Pages.ImagePath.toString Pages.images.elmcraftLogo, description = "Elmcraft Logo" }
        }
