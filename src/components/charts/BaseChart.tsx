import * as React from "react";
import { groupBy } from "lodash";
import { ColorScalePropType } from "victory-core";
import { SurveyRecord } from "../../lib/d";

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

export type BaseChartProps = {
  responseData: SurveyRecord[];
  variableX: keyof SurveyRecord;
  variableY?: keyof SurveyRecord;
};

type GroupedResponseData = {
  [group in keyof SurveyRecord]: SurveyRecord[];
};

export class BaseChart extends React.Component<BaseChartProps, null> {
  colorScale: ColorScalePropType;
  groupedData: GroupedResponseData;

  constructor(props: BaseChartProps) {
    super(props);
    this.colorScale = randomColors();
    // setup the data based on the specified variables
    this.groupedData = !this.props.variableY
      ? groupBy(
          this.props.responseData,
          (r: SurveyRecord) => r[this.props.variableX],
        )
      : this.props.responseData;
  }
}
