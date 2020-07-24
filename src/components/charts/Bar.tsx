import * as React from "react";
import { VictoryChart, VictoryBar, VictoryLabel, VictoryAxis } from "victory";
import { SurveyRecord } from "../../lib/d";
import { BaseChartProps, BaseChart } from "./BaseChart";
import { textWithLineBreaks } from "../../lib/util";
import theme from "./theme";

interface BarChartProps extends BaseChartProps {
  horizontal: boolean;
}
export default class Bar extends BaseChart<BarChartProps> {
  horizontal = false;

  constructor(props: BarChartProps) {
    super(props);
    this.horizontal = this.props.horizontal || false;
  }

  render(): React.ReactElement {
    const data = Object.entries(this.groupedData).map(
      ([key, groupData]: [string, SurveyRecord[]]) => ({
        x: key,
        y: groupData.length,
      }),
    );

    return (
      <VictoryChart
        theme={theme}
        padding={{ left: 140, right: 40, bottom: 20, top: 20 }}
        width={300}
        height={this.horizontal ? data.length * 30 : 300}
      >
        <VictoryAxis tickFormat={textWithLineBreaks} />
        {this.horizontal ? (
          <VictoryBar
            horizontal={true}
            barWidth={20}
            labels={({ datum }) => datum.y}
            data={data}
          />
        ) : (
          <VictoryBar
            labelComponent={<VictoryLabel dx={-10} textAnchor="end" />}
            data={data}
          />
        )}
      </VictoryChart>
    );
  }
}
