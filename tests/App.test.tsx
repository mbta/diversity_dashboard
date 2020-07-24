import * as React from "react";
import * as ReactDOM from "react-dom";
import * as TestUtils from "react-dom/test-utils";
import App from "../src/components/App";

let container = null;
beforeEach(() => {
  // setup a DOM element as a render target
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  // cleanup on exiting
  ReactDOM.unmountComponentAtNode(container);
  container.remove();
  container = null;
});

it("App is rendered", () => {
  TestUtils.act(() => {
    ReactDOM.render(<App />, container);
  });
  expect(container.textContent).toContain("Dashboard");
});
