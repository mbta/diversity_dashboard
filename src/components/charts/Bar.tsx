import * as React from "react";
import { VictoryChart, VictoryTheme, VictoryBar } from "victory";
import { SurveyRecord } from "../../lib/d";
import { BaseChartProps, BaseChart } from "./BaseChart";

export default class Bar extends BaseChart {
  constructor(props: BaseChartProps) {
    super(props);
  }

  render(): React.ReactElement {
    return (
      <VictoryChart domainPadding={20}>
        <VictoryBar
          theme={VictoryTheme.material}
          data={Object.entries(this.groupedData).map(
            ([key, groupData]: [string, SurveyRecord[]]) => ({
              x: key,
              y: groupData.length,
            }),
          )}
        />
      </VictoryChart>
    );
  }
}
