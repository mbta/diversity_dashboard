import {
  SurveyRecord,
  GenderResponse,
  RaceResponse,
  LatinxResponse,
  EmploymentTypeResponse,
  CompensationRangeResponse,
} from "./d";

export const workCategoryOptions = [
         "Administration / Recruitment",
         "Content",
         "Design",
         "Engineering",
         "Leadership",
         "Product / Project Management",
       ];

const rawStaffData = `Male	White	No	Full-Time (30 or more hours per week)	Leadership	3
Male	White	No	Full-Time (30 or more hours per week)	Leadership	1
Female	White	No	Full-Time (30 or more hours per week)	Administration / Recruitment	2
Male	White	No	Full-Time (30 or more hours per week)	Engineering	2
Female	White	No	Full-Time (30 or more hours per week)	Product / Project Management	3
Male	White	No	Full-Time (30 or more hours per week)	Leadership	3
Non-binary/third gender	White	No	Full-Time (30 or more hours per week)	Engineering	4
Male	White	No	Full-Time (30 or more hours per week)	Leadership	2
Male	Black or African American	No	Full-Time (30 or more hours per week)	Design	1
Male	White	No	Full-Time (30 or more hours per week)	Engineering	5
Male	White	No	Part-Time (below 30 hours per week)	Engineering	3
Female	Prefer not to say	Yes	Full-Time (30 or more hours per week)	Product / Project Management	2
Male	White	Yes	Full-Time (30 or more hours per week)	Engineering	2
Non-binary/third gender	White	No	Full-Time (30 or more hours per week)	Design	2
Male	White	No	Full-Time (30 or more hours per week)	Engineering	2
Female	White	No	Full-Time (30 or more hours per week)	Product / Project Management	1
Male	White	No	Full-Time (30 or more hours per week)	Leadership	18
Male	White	Yes	Full-Time (30 or more hours per week)	Engineering	4
Female	White	Yes	Full-Time (30 or more hours per week)	Engineering	1
Female	White	No	Full-Time (30 or more hours per week)	Content	1
Female	White	No	Full-Time (30 or more hours per week)	Product / Project Management	2
Male	White	No	Full-Time (30 or more hours per week)	Design	3
Female	White	No	Full-Time (30 or more hours per week)	Product / Project Management	1
Female	White	No	Full-Time (30 or more hours per week)	Engineering	1
Male	White	No	Full-Time (30 or more hours per week)	Engineering	1
Male	White	No	Full-Time (30 or more hours per week)	Engineering	2
Male	White	No	Full-Time (30 or more hours per week)	Administration / Recruitment	3
Male	Asian	No	Full-Time (30 or more hours per week)	Product / Project Management	3
Male	White	No	Full-Time (30 or more hours per week)	Product / Project Management	3
Female	White	No	Full-Time (30 or more hours per week)	Design	3
Female	Asian	No	Full-Time (30 or more hours per week)	Content	3
Male	Prefer not to say	Yes	Full-Time (30 or more hours per week)	Product / Project Management	4
Male	Asian	No	Full-Time (30 or more hours per week)	Leadership	3
Male	White	No	Full-Time (30 or more hours per week)	Product / Project Management	2
Male	White	No	Full-Time (30 or more hours per week)	Engineering	2
Female	Asian	No	Full-Time (30 or more hours per week)	Product / Project Management	1
Female	Asian, Black or African American	No	Full-Time (30 or more hours per week)	Design	3
Female	White	No	Full-Time (30 or more hours per week)	Leadership	3
Female	White	No	Full-Time (30 or more hours per week)	Content	1
Non-binary/third gender	White	No	Full-Time (30 or more hours per week)	Engineering	1
Female	White	No	Full-Time (30 or more hours per week)	Leadership	3
Male	White	No	Full-Time (30 or more hours per week)	Product / Project Management	2
Female	Black or African American	No	Full-Time (30 or more hours per week)	Content	1
Male	White	No	Full-Time (30 or more hours per week)	Engineering	2
Male	White	No	Full-Time (30 or more hours per week)	Product / Project Management	1
Female	White	Yes	Full-Time (30 or more hours per week)	Engineering	1
Female	Asian	No	Full-Time (30 or more hours per week)	Product / Project Management	1`;

const rawStaffRecords:SurveyRecord[] = rawStaffData.split("\n").map((line) => {
    const data = line.split("\t");
    return {
      gender: data[0].toLowerCase() as unknown as GenderResponse,
      race: data[1] as unknown as RaceResponse,
      latinx: data[2].toLocaleLowerCase() as unknown as LatinxResponse,
      employment_type: data[3].indexOf("Full") !== -1 ? "full" : "part" as unknown as EmploymentTypeResponse,
      work_category: data[4] as string,
      tenure: data[5] as unknown as number,
      compensation_range: "0 - 20,000" as unknown as CompensationRangeResponse,
    } as SurveyRecord;
});

export default rawStaffRecords;