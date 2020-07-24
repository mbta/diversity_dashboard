export interface GenderPercents {
  male: number;
  female: number;
  other: number;
  not_say: number;
}

export interface RacePercents {
  asian: number;
  black_or_african_american: number;
  native_american_or_alaskan_native: number;
  native_hawaiian_or_other_pacific_islander: number;
  white: number;
  other: number;
  not_say: number;
}

export interface LatinxPercents {
  yes: number;
  no: number;
  not_say: number;
}

export interface ReferenceData {
  gender: GenderPercents;
  race: RacePercents;
  is_hispanic_latinx: LatinxPercents;
}

export enum LatinxResponse {
  "yes",
  "no",
  "Prefer not to say",
}

export enum GenderResponse {
  "male",
  "female",
  "other",
  "no",
}

export enum RaceResponse {
  "Asian",
  "Black or African American",
  "Native American or Alaskan Native",
  "Native Hawaiian or Other Pacific Islander",
  "White",
  "Other",
  "Prefer not to say",
}

export enum EmploymentTypeResponse {
  "part",
  "full",
}

export enum CompensationRangeResponse {
  "0 - 20,000",
  "20,001 - 40,000",
  "40,001 - 60,000",
  "60,001 - 80,000",
  "80,001 - 100,000",
  "100,001 - 120,000",
  "120,001 - 140,000",
  "140,001 - 160,000",
  "160,001 - 180,000",
  "180,001 - 200,000",
  "200,001 - 220,000",
  "220,001 - 240,000",
  "240,001 - 260,000",
  "260,001 - 280,000",
  "Above 280,000",
}

export enum BucketedCompensationRangeResponse {
  "0 - 60,000",
  "60,001 - 100,000",
  "100,001 - 140,000",
  "140,001 - 180,000",
  "Over 180,00",
}

export enum BucketedTenureResponse {
  "1 year or less",
  "1 to 2 years",
  "2 to 5 years",
  "5 to 10 years",
  "more than 10 years",
}

export interface SurveyRecord {
  gender: GenderResponse;
  race: RaceResponse;
  latinx: LatinxResponse;
  employment_type: EmploymentTypeResponse;
  work_category: string;
  tenure: number;
  compensation_range: CompensationRangeResponse;
}

export interface SurveyRecordBucketed extends SurveyRecord {
  tenure_bucketed?: BucketedTenureResponse;
  compensation_range_bucketed?: BucketedCompensationRangeResponse;
}

export interface DashboardData {
  reference: ReferenceData;
  survey_records: SurveyRecord[];
}
