import * as React from "react";
import { groupBy } from "lodash";
import {
  VictoryChart,
  VictoryAxis,
  VictoryBar,
  VictoryStack,
  VictoryTooltip,
} from "victory";
import { ColorScalePropType } from "victory-core";
import { SurveyRecord } from "../../lib/d";
import { workCategoryOptions } from "../../lib/sample-data";
import { GroupedResponseData } from "./BaseChart";
import { textWithLineBreaks } from "../../lib/util";
import theme from "./theme";

const colorScales = [
  "grayscale",
  "qualitative",
  "heatmap",
  "warm",
  "cool",
  "red",
  "green",
  "blue",
] as ColorScalePropType[];
const randomColors = () =>
  colorScales[Math.floor(Math.random() * colorScales.length)];

export default function JobCategoryBar(props: {
  data: SurveyRecord[];
  variable: keyof SurveyRecord;
}): React.ReactElement {
  const colors = randomColors();
  return (
    <VictoryChart
      theme={theme}
      width={300}
      height={workCategoryOptions.length * 28}
      padding={{ left: 180, right: 10, bottom: 10, top: 10 }}
    >
      <VictoryAxis tickFormat={textWithLineBreaks} />
      {workCategoryOptions.map((category) => {
        const inCategory = props.data.filter(
          (d) => d["work_category"] === category,
        );
        const dataByVariable: GroupedResponseData = groupBy(
          inCategory,
          (r: SurveyRecord) => r[props.variable],
        );

        return (
          <VictoryStack key={category} theme={theme} colorScale={colors}>
            {Object.entries(dataByVariable).map(([label, data]) => (
              <VictoryBar
                key={label}
                theme={theme}
                barWidth={20}
                data={data}
                horizontal={true}
                y={props.variable}
                x="work_category"
                labels={({ datum }) => datum[props.variable]}
                labelComponent={<VictoryTooltip />}
              />
            ))}
          </VictoryStack>
        );
      })}
    </VictoryChart>
  );
}
