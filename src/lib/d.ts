interface GenderPercents {
  male: number;
  female: number;
  other: number;
  not_say: number;
}

interface RacePercents {
  asian: number;
  black_or_african_american: number;
  native_american_or_alaskan_native: number;
  native_hawaiian_or_other_pacific_islander: number;
  white: number;
  other: number;
  not_say: number;
}

interface LatinxPercents {
  yes: number;
  no: number;
  not_say: number;
}

interface ReferenceData {
  gender: GenderPercents;
  race: RacePercents;
  is_hispanic_latinx: LatinxPercents;
}

type GenderResponse = "male" | "female" | "other" | "no";

type RaceResponse =
  | "Asian"
  | "Black or African American"
  | "Native American or Alaskan Native"
  | "Native Hawaiian or Other Pacific Islander"
  | "White"
  | "Other"
  | "Prefer not to say";

type EmploymentTypeResponse = "part" | "full";

type CompensationRangeResponse =
  | "0 - 20,000"
  | "20,001 - 40,000"
  | "40,001 - 60,000"
  | "60,001 - 80,000"
  | "80,001 - 100,000"
  | "100,001 - 120,000"
  | "120,001 - 140,000"
  | "140,001 - 160,000"
  | "160,001 - 180,000"
  | "180,001 - 200,000"
  | "200,001 - 220,000"
  | "220,001 - 240,000"
  | "240,001 - 260,000"
  | "260,001 - 280,000"
  | "Above 280,000";

interface SurveyRecord {
  gender: GenderResponse;
  race: RaceResponse;
  employment_type: EmploymentTypeResponse;
  work_category: string;
  tenure: number;
  compensation_range: CompensationRangeResponse;
}

interface DashboardData {
  reference: ReferenceData;
  survey_records: SurveyRecord[];
}
