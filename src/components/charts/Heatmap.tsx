import * as React from "react";
import HeatMap from "react-heatmap-grid";
import { SurveyRecord } from "./../../lib/d";

interface Props {
  data: SurveyRecord[];
  xKey: string;
  yKey: string;
  xLabels: string[];
  yLabels: string[];
}

export default function Heatmap({
  data,
  xKey,
  yKey,
  xLabels,
  yLabels,
}: Props): React.ReactElement {
  const matrix = Array(yLabels.length)
    .fill(undefined)
    .map(() => Array(xLabels.length).fill(0));

  data.forEach((element: SurveyRecord) => {
    const yPosition = yLabels.indexOf(element[yKey]);
    const xPosition = xLabels.indexOf(element[xKey]);
    matrix[yPosition][xPosition] += 1;
  });

  return (
    <HeatMap
      xLabels={xLabels}
      yLabels={yLabels}
      yLabelWidth={200}
      xLabelsLocation={"bottom"}
      xLabelWidth={100}
      data={matrix}
      height={45}
      cellStyle={(_background, value, min, max, _data, _x, _y) => ({
        background: `rgb(0, 151, 230, ${1 - (max - value) / (max - min)})`,
        fontSize: "11.5px",
        color: "#444",
      })}
      cellRender={(value: any) => value && <div>{value}</div>}
    />
  );
}
