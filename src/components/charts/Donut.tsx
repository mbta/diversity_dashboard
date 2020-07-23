import * as React from "react";
import { VictoryPie, VictoryTheme } from "victory";
import { SurveyRecord } from "../../lib/d";
import { BaseChartProps, BaseChart } from "./BaseChart";

export default class Donut extends BaseChart {
  constructor(props: BaseChartProps) {
    super(props);
  }

  render(): React.ReactElement {
    return (
      <VictoryPie
        width={400}
        height={400}
        theme={VictoryTheme.material}
        colorScale={this.colorScale}
        data={Object.entries(this.groupedData).map(
          ([key, groupData]: [string, SurveyRecord[]]) => ({
            x: key,
            y: groupData.length,
          }),
        )}
        innerRadius={48}
        labelRadius={60}
        style={{ labels: { fontSize: 20, fill: "#000", fontWeight: "bold" } }}
      />
    );
  }
}
