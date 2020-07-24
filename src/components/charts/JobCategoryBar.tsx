import * as React from "react";
import { groupBy } from "lodash";
import {
  VictoryChart,
  VictoryAxis,
  VictoryBar,
  VictoryLabel,
  VictoryStack,
  VictoryTooltip,
} from "victory";
import { SurveyRecord } from "../../lib/d";
import { workCategoryOptions } from "../../lib/sample-data";
import { GroupedResponseData } from "./BaseChart";
import { textWithLineBreaks } from "../../lib/util";

export default function JobCategoryBar(props: {
  data: SurveyRecord[];
  variable: keyof SurveyRecord;
}): React.ReactElement {
  return (
    <VictoryChart
      domainPadding={20}
      padding={{ left: 170, right: 40, bottom: 50, top: 50 }}
    >
      {workCategoryOptions.map((category) => {
        const inCategory = props.data.filter(
          (d) => d["work_category"] === category,
        );
        const dataByVariable: GroupedResponseData = groupBy(
          inCategory,
          (r: SurveyRecord) => r[props.variable],
        );

        return (
          <VictoryStack key={category} colorScale="qualitative">
            {Object.entries(dataByVariable).map(([label, data]) => (
              <VictoryBar
                key={label}
                barWidth={24}
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

      <VictoryAxis
        tickFormat={textWithLineBreaks}
        tickLabelComponent={<VictoryLabel style={{ fontSize: 12 }} />}
      />
    </VictoryChart>
  );
}
