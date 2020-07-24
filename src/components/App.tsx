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
        <div className="col">
          <h1>Diversity, Equity, &amp; Inclusion Dashboard</h1>
        </div>
      </div>
      <div className="row">
        <div className="col">
          <p className="mb-3">
            The following Diversity, Equity, &amp; Inclusion Dashboard (Beta)
            provides an interactive look at who we are, what work we do, and how
            we are compensated today.
          </p>
        </div>
        <NewLineSeparator />
      </div>
      <div className="row row-cols-3">
        <ChartBlock title="Gender" noBorders={false}>
          <Donut responseData={data} variableX="gender" />
        </ChartBlock>
        <ChartBlock title="Race" noBorders={true}>
          <Donut responseData={data} variableX="race" />
        </ChartBlock>
        <ChartBlock title="Latinx" noBorders={false}>
          <Bar responseData={data} variableX="latinx" />
        </ChartBlock>

        <SectionHeader title={`Distributions: Work category`} />
        <ChartBlock title="by gender" noBorders={false}>
          <JobCategoryBar data={data} variable="gender" />
        </ChartBlock>
        <ChartBlock title="by race" noBorders={true}>
          <JobCategoryBar data={data} variable="race" />
        </ChartBlock>
        <ChartBlock title="by ethnicity" noBorders={false}>
          <JobCategoryBar data={data} variable="latinx" />
        </ChartBlock>

        <SectionHeader title={`Distributions: Average job tenure`} />
        <ChartBlock title="by race" noBorders={false}>
          <AvgTenureBar data={data} variable="race" />
        </ChartBlock>
        <ChartBlock title="by gender" noBorders={true}>
          <AvgTenureBar data={data} variable="gender" />
        </ChartBlock>
        <ChartBlock title="by ethnicity" noBorders={false}>
          <AvgTenureBar data={data} variable="latinx" />
        </ChartBlock>

        <SectionHeader title={`Correlations: Pay`} />
        <ChartBlock title="by gender" noBorders={false}>
          <HeatMap
            data={dataBucketed}
            xKey={"gender"}
            yKey={"compensation_range_bucketed"}
            xLabels={enumToArray(GenderResponse)}
            yLabels={enumToArray(BucketedCompensationRangeResponse)}
          />
        </ChartBlock>
        <ChartBlock title="by race" noBorders={true}>
          <HeatMap
            data={dataBucketed}
            xKey={"race"}
            yKey={"compensation_range_bucketed"}
            xLabels={enumToArray(RaceResponse)}
            yLabels={enumToArray(BucketedCompensationRangeResponse)}
          />
        </ChartBlock>
        <ChartBlock title="Latinx" noBorders={false}>
          <HeatMap
            data={dataBucketed}
            xKey={"latinx"}
            yKey={"compensation_range_bucketed"}
            xLabels={enumToArray(LatinxResponse)}
            yLabels={enumToArray(BucketedCompensationRangeResponse)}
          />
        </ChartBlock>

        <SectionHeader title={`Correlations: Work category`} />
        <ChartBlock title="by gender" noBorders={false}>
          <HeatMap
            data={data}
            xKey={"gender"}
            yKey={"work_category"}
            xLabels={enumToArray(GenderResponse)}
            yLabels={workCategoryResponses}
          />
        </ChartBlock>
        <ChartBlock title="by race" noBorders={true}>
          <HeatMap
            data={data}
            xKey={"race"}
            yKey={"work_category"}
            xLabels={enumToArray(RaceResponse)}
            yLabels={workCategoryResponses}
          />
        </ChartBlock>
        <ChartBlock title="Latinx" noBorders={false}>
          <HeatMap
            data={data}
            xKey={"latinx"}
            yKey={"work_category"}
            xLabels={enumToArray(LatinxResponse)}
            yLabels={workCategoryResponses}
          />
        </ChartBlock>

        <SectionHeader title={`Correlations: Tenure`} />
        <ChartBlock title="by gender" noBorders={false}>
          <HeatMap
            data={dataBucketed}
            xKey={"gender"}
            yKey={"tenure_bucketed"}
            xLabels={enumToArray(GenderResponse)}
            yLabels={enumToArray(BucketedTenureResponse)}
          />
        </ChartBlock>
        <ChartBlock title="by race" noBorders={true}>
          <HeatMap
            data={dataBucketed}
            xKey={"race"}
            yKey={"tenure_bucketed"}
            xLabels={enumToArray(RaceResponse)}
            yLabels={enumToArray(BucketedTenureResponse)}
          />
        </ChartBlock>
        <ChartBlock title="Latinx" noBorders={false}>
          <HeatMap
            data={dataBucketed}
            xKey={"latinx"}
            yKey={"tenure_bucketed"}
            xLabels={enumToArray(LatinxResponse)}
            yLabels={enumToArray(BucketedTenureResponse)}
          />
        </ChartBlock>
      </div>
    </div>
  );
}

declare let module: Record<string, unknown>;

export default hot(module)(App);
