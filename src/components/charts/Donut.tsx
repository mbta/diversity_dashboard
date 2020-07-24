import * as React from "react";
import { VictoryPie, VictoryTheme } from "victory";
import { SurveyRecord } from "../../lib/d";
import { BaseChartProps, BaseChart } from "./BaseChart";
import theme from "./theme";

export default class Donut extends BaseChart<BaseChartProps> {
  constructor(props: BaseChartProps) {
    super(props);
  }

  render(): React.ReactElement {
    return (
      <VictoryPie
        width={400}
        height={400}
        theme={theme}
        colorScale={this.colorScale}
        data={Object.entries(this.groupedData).map(
          ([key, groupData]: [string, SurveyRecord[]]) => ({
            x: key,
            y: groupData.length,
          }),
        )}
        innerRadius={48}
        labelRadius={60}
        // style={{ labels: { fill: "#000" } }}
      />
    );
  }
}
