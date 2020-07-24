import * as React from "react";

export const NewLineSeparator = (): React.ReactElement => (
  <div className="w-100"></div>
);

export const SectionHeader = (props: { title: string }): React.ReactElement => (
  <div className="col-12">
    <h2 className="mt-3">{props.title}</h2>
  </div>
);
