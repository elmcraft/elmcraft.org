module Data.Conferences exposing (..)

import Types exposing (..)


conferenceDetails : Conference -> ConferenceDetails
conferenceDetails conference =
    case conference of
        ElmConf2016 ->
            { locationFlag = "🇺🇸", name = "Elm Conf 2016", url = "https://2016.elm-conf.us/", date = "September 15" }

        ElmEurope2017 ->
            { locationFlag = "🇫🇷", name = "Elm Europe 2017", url = "https://2017.elmeurope.org/", date = "June 8-9" }

        ElmConf2017 ->
            { locationFlag = "🇺🇸", name = "Elm Conf 2017", url = "https://2017.elm-conf.us/", date = "September 28" }

        OsloElmDay2017 ->
            { locationFlag = "🇳🇴", name = "Oslo Elm Day 2017", url = "https://2017.osloelmday.no/", date = "June 10" }

        ElmEurope2018 ->
            { locationFlag = "🇫🇷", name = "Elm Europe 2018", url = "https://2018.elmeurope.org/", date = "July 5-6" }

        ElmConf2018 ->
            { locationFlag = "🇺🇸", name = "Elm Conf 2018", url = "https://2018.elm-conf.us/", date = "September 26" }

        OsloElmDay2019 ->
            { locationFlag = "🇳🇴", name = "Oslo Elm Day 2019", url = "https://2019.osloelmday.no/", date = "February 16" }

        ElmintheSpring2019 ->
            { locationFlag = "🇺🇸", name = "Elm in the Spring 2019", url = "https://2019.elminthespring.org/", date = "April 26" }

        ElmEurope2019 ->
            { locationFlag = "🇫🇷", name = "Elm Europe 2019", url = "https://2019.elmeurope.org/", date = "June 27-28" }

        ElmConf2019 ->
            { locationFlag = "🇺🇸", name = "Elm Conf 2019", url = "https://2019.elm-conf.com/", date = "September 12" }

        ElmJapan2020 ->
            { locationFlag = "🇯🇵", name = "Elm Japan 2020", url = "https://elmjapan.org/", date = "April 4 (Covid Cancelled)" }

        ElmConf2020 ->
            { locationFlag = "🇺🇸", name = "Elm Conf 2020", url = "https://2020.elm-conf.com/", date = "(Covid Cancelled)" }

        ElmintheSpring2020 ->
            { locationFlag = "🇺🇸", name = "Elm in the Spring 2020", url = "https://elminthespring.org/", date = "(Covid Postponed)" }
