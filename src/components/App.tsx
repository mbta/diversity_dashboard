import * as React from "react";
import { hot } from "react-hot-loader";

import "./../assets/scss/App.scss";

declare var dashboardData: any;

function App() {
  return (
    <div className="app">
      <h1>Hello {dashboardData.name}!</h1>
    </div>
  );
}

declare let module: Record<string, unknown>;

export default hot(module)(App);
