// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html";
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix";
import { LiveSocket } from "phoenix_live_view";
import topbar from "../vendor/topbar";
import Alpine from 'alpinejs'
import live_select from "live_select"
import Download from "./hooks/download"

window.Alpine = Alpine
 
Alpine.start()

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute("content");
let Hooks = {
  Download,
  ...live_select
}

let liveSocket = new LiveSocket("/live", Socket, {
  hooks: Hooks,
  longPollFallbackMs: 2500,
  params: { _csrf_token: csrfToken },
  dom: {
    onBeforeElUpdated(from, to) {
      if (from._x_dataStack) {
        window.Alpine.clone(from, to);
      }
    },
  },
});
/**
dom.onBeforeElUpdated Configuration:
Under the hood, LiveView "patches" the DOM using a library called morphdom. Every time LiveView wants to update an element it replaces the old <el> with a freshly‑rendered <el>. Unfortunately Alpine.js stores all of its reactive state in a hidden property (_x_dataStack) on the old element, so by default any Alpine‑driven UI (dropdowns, tabs, toggles, etc.) will get reset whenever LiveView patches it.

The onBeforeElUpdated(from, to) hook gives us a chance to copy anything from the old node into the new one before replacement. By checking for from._x_dataStack (i.e. "did Alpine initialize this node?") and then calling window.Alpine.clone(from, to), you transplant the Alpine‑managed state into the new element so your UI doesn't "blink" or reset on every LiveView update 
Stack Overflow ref: https://stackoverflow.com/questions/75630647/modify-alpinejs-x-data-from-elixir-phoenix-liveviews-js-library
.
 */

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" });
window.addEventListener("phx:page-loading-start", (_info) => topbar.show(300));
window.addEventListener("phx:page-loading-stop", (_info) => topbar.hide());

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;

window.addEventListener("phx:copy", (event) => {
  let text = event.target.innerText;
  navigator.clipboard.writeText(text).then(() => {
    let copyBtn = document.getElementById("copy-button");
    copyBtn.innerHTML = "Copied! 📋";
    setTimeout(() => {
      copyBtn.innerHTML = "Copy 📋";
    }, 1000);
  });
});
