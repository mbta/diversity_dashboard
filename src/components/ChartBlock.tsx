import * as React from "react";

export default function ChartBlock(props: {
  title: string;
  children: React.ReactElement;
  noBorders: boolean;
}): React.ReactElement {
  return (
    <div
      className="col border-medium-gray"
      style={props.noBorders ? { borderLeft: 0, borderRight: 0 } : {}}
    >
      <p className="mb-0 mt-3 text-uppercase">{props.title}</p>
      {props.children}
    </div>
  );
}
