import { SurveyRecord } from "./d";

export const enumToArray = (object: any) =>
  Object.keys(object).filter((k) => Number.isNaN(Number(k)));

export const textWithLineBreaks = (t: string): string =>
  t.match(/\b[\w']+(?:[^\w\n]+[\w']+){0,2}\b/g).join("\n") || t;

export const elementValueToList = (data: Array<SurveyRecord>, key: string) =>
  data.reduce((accumulator: Array<string>, record: SurveyRecord) => {
    if (accumulator.indexOf(record[key]) === -1) {
      return accumulator.concat(record[key]);
    }
    return accumulator;
  }, []);

export const castStringsToInts = (data: Array<string>): Array<number> =>
  data.map((el) => parseInt(el));
