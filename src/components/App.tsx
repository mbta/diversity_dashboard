import * as React from "react";
import { hot } from "react-hot-loader";

import "./../assets/scss/App.scss";
import { SectionHeader, NewLineSeparator } from "./Layout";
import { sampleSurveyRecords } from "../lib/sample-data";
import Donut from "./charts/Donut";
import ChartBlock from "./ChartBlock";
import Bar from "./charts/Bar";
import AvgTenureBar from "./charts/AvgTenureBar";

declare var dashboardData: any; // eslint-disable-line no-var
const data = sampleSurveyRecords(50);

function App() {
  return (
    <div className="container-fluid">
      <div className="row">
        <header className="col bg-accent-light p-3 m-2">
          <small>{dashboardData.name}</small>
          <h1>Diversity, Equity, & Inclusion Dashboard</h1>
        </header>
        <header className="col p-3 m-2">
          <p className="lead">The future is here.</p>
          <p>
            Add your data by completing <a href="">the anonymous survey</a>.
          </p>
        </header>
        <NewLineSeparator />
        {/* Stacked and/or diverging bar, donut, treemap, probably */}
        <ChartBlock title="Gender?">
          <Donut responseData={data} variableX="gender" />
        </ChartBlock>
        <ChartBlock title="Race">
          <Donut responseData={data} variableX="race" />
        </ChartBlock>
        <ChartBlock title="Latinx">
          <Bar responseData={data} variableX="latinx" />
        </ChartBlock>
        <SectionHeader title={`Distributions across ${dashboardData.name}`} />
        {/* histogram, dot plot, or box plot, probably */}
        <section className="viz">
          <p>Pay rate + gender</p>
          <p>Pay rate + race</p>
          <p>Pay rate + ethnicity</p>
        </section>
        <section className="viz">
          <p>Job category + gender</p>
          <p>Job category + race</p>
          <p>Job category + ethnicity</p>
        </section>
        <ChartBlock title={`Average job tenure across ${dashboardData.name} `}>
          <AvgTenureBar data={data} />
        </ChartBlock>
        <SectionHeader title={`Correlations at ${dashboardData.name} `} />
        {/* XY heatmaps, probably */}
        <section className="viz">
          <p>Pay rate + gender</p>
          <p>Pay rate + race</p>
          <p>Pay rate + ethnicity</p>
        </section>
        <section className="viz">
          <p>Job category + gender</p>
          <p>Job category + race</p>
          <p>Job category + ethnicity</p>
        </section>
        <section className="viz">
          <p>Job tenure + gender</p>
          <p>Job tenure + race</p>
          <p>Job tenure + ethnicity</p>
        </section>
      </div>
    </div>
  );
}

declare let module: Record<string, unknown>;

export default hot(module)(App);
