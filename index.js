import "./public/style.css";
// import { Elm } from "./src/Main.elm";
// import pagesInit from "elm-pages";

const isPrerendering = navigator.userAgent.indexOf("Headless") >= 0

// pagesInit({
//   mainElmModule: Elm.Main
// }).then(app => {
//   // post-load
//   app.ports.setDev.send(window.location.hostname == "localhost")
// })

export default {
  load: function (elmLoaded) {},
  flags: function () {
    return null;
  },
};