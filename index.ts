
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

window.addEventListener("hashchange", function(){
  console.log('hashchange');
  highlightParentOfHash();
});

window.addEventListener("load", function(){
  console.log('hashchangeload');
  highlightParentOfHash();
});

function highlightParentOfHash() {
  let hash = window.location.hash.substr(1); // Remove the '#'
  console.log('trying to hilight hash', hash)
  if (hash) {
    let element = document.getElementById(hash);
    console.log('find element', element);
    if (element && element.parentElement) {
      let parentElement = element.parentElement;
      parentElement.classList.add("highlight");
      setTimeout(() => { parentElement.classList.remove("highlight"); }, 4000);
    }
  }
}

export default config;
