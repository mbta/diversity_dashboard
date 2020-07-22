import * as React from "react";

export const NewLineSeparator = (): React.ReactElement => (
  <div className="w-100"></div>
);

export const SectionHeader = (props: { title: string }): React.ReactElement => (
  <>
    <div className="w-100"></div>
    <header className="col my-3 p-2 bg-accent-light">
      <p className="lead p-2 m-0 text-center bg-white">{props.title}</p>
    </header>
    <div className="w-100"></div>
  </>
);
