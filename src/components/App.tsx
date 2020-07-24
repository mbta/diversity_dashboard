import * as React from "react";
import { hot } from "react-hot-loader";

import "./../assets/scss/App.scss";
import {
  GenderResponse,
  RaceResponse,
  LatinxResponse,
  BucketedCompensationRangeResponse,
  BucketedTenureResponse,
} from "./../lib/d";
import { SectionHeader, NewLineSeparator } from "./Layout";
import { sampleSurveyRecords } from "../lib/sample-data";
import {
  enumToArray,
  elementValueToList,
  bucketCompensationRanges,
  bucketTenureData,
} from "./../lib/util";
import Donut from "./charts/Donut";
import ChartBlock from "./ChartBlock";
import Bar from "./charts/Bar";
import AvgTenureBar from "./charts/AvgTenureBar";
import HeatMap from "./charts/Heatmap";
import JobCategoryBar from "./charts/JobCategoryBar";

declare var dashboardData: any; // eslint-disable-line no-var
const data = sampleSurveyRecords(100);
const dataBucketed = bucketCompensationRanges(bucketTenureData(data));
const workCategoryResponses = elementValueToList(data, "work_category").sort();

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
        <SectionHeader title={`Job types across ${dashboardData.name}`} />
        <ChartBlock title="by race">
          <JobCategoryBar data={data} variable="race" />
        </ChartBlock>
        <ChartBlock title="by gender">
          <JobCategoryBar data={data} variable="gender" />
        </ChartBlock>
        <ChartBlock title="by ethnicity">
          <JobCategoryBar data={data} variable="latinx" />
        </ChartBlock>
        <SectionHeader title={`Average job tenure at ${dashboardData.name} `} />
        <ChartBlock title="by race">
          <AvgTenureBar data={data} variable="race" />
        </ChartBlock>
        <ChartBlock title="by gender">
          <AvgTenureBar data={data} variable="gender" />
        </ChartBlock>
        <ChartBlock title="by ethnicity">
          <AvgTenureBar data={data} variable="latinx" />
        </ChartBlock>
        <SectionHeader title={`Pay at ${dashboardData.name} `} />
        <section className="viz viz-100">
          <div className="container-fluid">
            <div className="row">
              <HeatMap
                data={dataBucketed}
                xKey={"gender"}
                yKey={"compensation_range_bucketed"}
                xLabels={enumToArray(GenderResponse)}
                yLabels={enumToArray(BucketedCompensationRangeResponse)}
              />
              <HeatMap
                data={dataBucketed}
                xKey={"race"}
                yKey={"compensation_range_bucketed"}
                xLabels={enumToArray(RaceResponse)}
                yLabels={enumToArray(BucketedCompensationRangeResponse)}
              />
              <HeatMap
                data={dataBucketed}
                xKey={"latinx"}
                yKey={"compensation_range_bucketed"}
                xLabels={enumToArray(LatinxResponse)}
                yLabels={enumToArray(BucketedCompensationRangeResponse)}
              />
            </div>
          </div>
        </section>
        <section className="viz viz-100">
          <div className="container-fluid">
            <div className="row">
              <HeatMap
                data={data}
                xKey={"gender"}
                yKey={"work_category"}
                xLabels={enumToArray(GenderResponse)}
                yLabels={workCategoryResponses}
              />
              <HeatMap
                data={data}
                xKey={"race"}
                yKey={"work_category"}
                xLabels={enumToArray(RaceResponse)}
                yLabels={workCategoryResponses}
              />
              <HeatMap
                data={data}
                xKey={"latinx"}
                yKey={"work_category"}
                xLabels={enumToArray(LatinxResponse)}
                yLabels={workCategoryResponses}
              />
            </div>
          </div>
        </section>
        <section className="viz viz-100">
          <div className="container-fluid">
            <div className="row">
              <HeatMap
                data={dataBucketed}
                xKey={"gender"}
                yKey={"tenure_bucketed"}
                xLabels={enumToArray(GenderResponse)}
                yLabels={enumToArray(BucketedTenureResponse)}
              />
              <HeatMap
                data={dataBucketed}
                xKey={"race"}
                yKey={"tenure_bucketed"}
                xLabels={enumToArray(RaceResponse)}
                yLabels={enumToArray(BucketedTenureResponse)}
              />
              <HeatMap
                data={dataBucketed}
                xKey={"latinx"}
                yKey={"tenure_bucketed"}
                xLabels={enumToArray(LatinxResponse)}
                yLabels={enumToArray(BucketedTenureResponse)}
              />
            </div>
          </div>
        </section>
      </div>
    </div>
  );
}

declare let module: Record<string, unknown>;

export default hot(module)(App);
