import "./style.css";
const { Elm } = require("./src/Main.elm");
const pagesInit = require("elm-pages");

const isPrerendering = navigator.userAgent.indexOf("Headless") >= 0

pagesInit({
  mainElmModule: Elm.Main
}).then(app => {
  // post-load
  app.ports.setDev.send(window.location.hostname == "localhost")
})
