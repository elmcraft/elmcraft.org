module DataStatic.Companies exposing (..)


type CompanyType
    = Product
    | Services


companies =
    [ { name = "Incremental Elm Consulting"
      , url = "https://cofoundry.uk/"
      , description = ""
      , companyType = [ Services ]
      }
    , { name = "Cofoundry"
      , url = "https://cofoundry.uk/"
      , description = "Delightful products for humans. Currently working on Lamdera."
      , companyType = [ Services, Product ]
      }
    , { name = "Curry Software"
      , url = "https://www.curry-software.com/en/elm-services/"
      , description = ""
      , companyType = [ Services ]
      }
    , { name = "DX"
      , url = "https://www.dx.tech/"
      , description = "A cinema operations software that is easy to use by anyone on the team"
      , companyType = [ Product ]
      }
    ]


testimonialTweets =
    [ { company = "https://www.dx.tech/"
      , tweet = "https://twitter.com/kurnick/status/1612369769608671233"
      , content = "Today I'm starting new @elmlang journey at DX https://linkedin.com/company/dx-entertainment After so many great years at GWI I'm excited to continue working with this great language and ecosystem."
      }
    ]
