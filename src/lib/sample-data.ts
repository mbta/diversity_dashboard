import {
  SurveyRecord,
  GenderResponse,
  RaceResponse,
  LatinxResponse,
  EmploymentTypeResponse,
  CompensationRangeResponse,
} from "./d";

import { enumToArray } from "./util";

const randomIndex = (array: Array<any>): any =>
  array[Math.floor(Math.random() * array.length)];

const randomGenderResponse = (): GenderResponse =>
  randomIndex(enumToArray(GenderResponse));

const randomRaceResponse = (): RaceResponse =>
  randomIndex(enumToArray(RaceResponse));

const randomLatinxResponse = (): LatinxResponse =>
  randomIndex(enumToArray(LatinxResponse));

const randomEmploymentTypeResponse = (): EmploymentTypeResponse =>
  randomIndex(enumToArray(EmploymentTypeResponse));

const randomCompensationRangeResponse = (): CompensationRangeResponse =>
  randomIndex(enumToArray(CompensationRangeResponse));

export const workCategoryOptions = [
  "Administration",
  "Content",
  "Design",
  "Engineering",
  "Leadership",
  "Product/Project Management",
  "Recruitment",
];

const numberBetweenOneAndTwenty = (): number =>
  Math.floor(Math.random() * (1 + 20 - 1)) + 1;

const sampleSurveyRecord = (): SurveyRecord => ({
  gender: randomGenderResponse(),
  race: randomRaceResponse(),
  latinx: randomLatinxResponse(),
  employment_type: randomEmploymentTypeResponse(),
  work_category: randomIndex(workCategoryOptions),
  tenure: numberBetweenOneAndTwenty(),
  compensation_range: randomCompensationRangeResponse(),
});

export const sampleSurveyRecords = (count: number): Array<SurveyRecord> =>
  Array.from({ length: count }, () => sampleSurveyRecord());
  