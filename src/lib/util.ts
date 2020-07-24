import {
  SurveyRecord,
  SurveyRecordBucketed,
  BucketedCompensationRangeResponse,
  BucketedTenureResponse,
} from "./d";

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

const bucketCompensationTranslation = {
  "0 - 20,000": "0 - 60,000",
  "20,001 - 40,000": "0 - 60,000",
  "40,001 - 60,000": "0 - 60,000",
  "60,001 - 80,000": "60,001 - 100,000",
  "80,001 - 100,000": "60,001 - 100,000",
  "100,001 - 120,000": "100,001 - 140,000",
  "120,001 - 140,000": "100,001 - 140,000",
  "140,001 - 160,000": "140,001 - 180,000",
  "160,001 - 180,000": "140,001 - 180,000",
  "180,001 - 200,000": "Over 180,00",
  "200,001 - 220,000": "Over 180,00",
  "220,001 - 240,000": "Over 180,00",
  "240,001 - 260,000": "Over 180,00",
  "260,001 - 280,000": "Over 180,00",
  "Above 280,000": "Over 180,00",
};

export const bucketCompensationRanges = (
  data: Array<SurveyRecord>,
): Array<SurveyRecordBucketed> =>
  data.map((record: SurveyRecord) => {
    const bucketedCompensation: BucketedCompensationRangeResponse =
      bucketCompensationTranslation[record["compensation_range"]];
    return {
      ...record,
      compensation_range_bucketed: bucketedCompensation,
    };
  });

const bucketedTenureResponse = (enumToArray(
  BucketedTenureResponse,
) as unknown) as Array<BucketedTenureResponse>;

const bucketTenureTranslation = {
  1: 0,
  2: 1,
  3: 2,
  4: 2,
  5: 3,
  6: 3,
  7: 3,
  8: 3,
  9: 3,
};

export const bucketTenureData = (
  data: Array<SurveyRecord>,
): Array<SurveyRecordBucketed> =>
  data.map((record: SurveyRecord) => {
    const bucketedTenure: BucketedTenureResponse =
      bucketedTenureResponse[bucketTenureTranslation[record["tenure"]] || 4];
    return { ...record, tenure_bucketed: bucketedTenure };
  });
