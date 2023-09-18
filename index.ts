// import "./public/style.css";
// const { Elm } = require("./src/Main.elm");
// const pagesInit = require("elm-pages");

// const isPrerendering = navigator.userAgent.indexOf("Headless") >= 0

// pagesInit({
//   mainElmModule: Elm.Main
// }).then(app => {
//   // post-load
//   app.ports.setDev.send(window.location.hostname == "localhost")
// })


type ElmPagesInit = {
  load: (elmLoaded: Promise<unknown>) => Promise<void>;
  flags: unknown;
};

const config: ElmPagesInit = {
  load: async function (elmLoaded) {
    await elmLoaded;
  },
  flags: function () {
    return "You can decode this in Shared.elm using Json.Decode.string!";
  },
};

export default config;
