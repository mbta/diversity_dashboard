import * as React from "react";

export default function ChartBlock(props: {
  title: string;
  children: React.ReactElement;
}): React.ReactElement {
  return (
    <section className="viz">
      <h1>{props.title}</h1>
      {props.children}
    </section>
  );
}
