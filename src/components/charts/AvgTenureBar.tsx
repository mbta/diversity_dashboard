import * as React from "react";
import { mean } from "d3-array";
import { groupBy } from "lodash";
import {
  VictoryChart,
  VictoryAxis,
  VictoryBar,
  VictoryLabel,
  VictoryTheme,
} from "victory";
import { textWithLineBreaks } from "../../lib/util";
import { SurveyRecord } from "../../lib/d";

export default function AvgTenureBar(props: {
  data: SurveyRecord[];
}): React.ReactElement {
  const dataByRace = groupBy(props.data, (r: SurveyRecord) => r["race"]);

  return (
    <VictoryChart
      theme={VictoryTheme.grayscale}
      padding={{ left: 140, right: 40, bottom: 50, top: 50 }}
    >
      {Object.entries(dataByRace).map((group, index) => {
        const [raceName, raceGroup] = group;
        const groupSum = mean(
          raceGroup as SurveyRecord[],
          (d: SurveyRecord) => d["tenure"],
        );
        return (
          <VictoryBar
            key={index}
            horizontal={true}
            barWidth={24}
            data={[{ x: raceName, y: groupSum }]}
            labels={({ datum }) => `${Math.round(datum.y * 100) / 100} yr`}
            labelComponent={<VictoryLabel dx={-10} textAnchor="end" />}
            style={{ labels: { fill: "white" } }}
          />
        );
      })}
      <VictoryAxis tickFormat={textWithLineBreaks} />
    </VictoryChart>
  );
}
