export const textWithLineBreaks = (t: string): string =>
  t.match(/\b[\w']+(?:[^\w\n]+[\w']+){0,2}\b/g).join("\n") || t;
