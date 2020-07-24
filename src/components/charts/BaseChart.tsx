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

export interface BaseChartProps {
  responseData: SurveyRecord[];
  variableX: keyof SurveyRecord;
  variableY?: keyof SurveyRecord;
}

export type GroupedResponseData = {
  [group in keyof SurveyRecord]: SurveyRecord[];
};

// generic class to be extended by the other chart types
export class BaseChart<P> extends React.Component<P & BaseChartProps, null> {
  colorScale: ColorScalePropType;
  groupedData: GroupedResponseData;

  constructor(props: P & BaseChartProps) {
    super(props);
    this.colorScale = randomColors();
    // setup the data based on the specified variables
    this.groupedData = groupBy(
      this.props.responseData,
      (r: SurveyRecord) => r[this.props.variableX],
    ) as GroupedResponseData;
  }
}
