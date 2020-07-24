# Diversity, Equity, & Inclusion Dashboard
> Helping organizations to be more accountable.

## Overview

Organizations that are serious about achieving diversity, equity, and inclusion need to know facts about their workforce to support their hiring process. For example:
- What is our gender breakdown?
- What is the racial/ethnic composition of our organization?
- How does our composition compare to the communities/customers we serve?
- Are people doing the same work at the same level compensated equally?

This project will house guidance on how to collect this information while protecting the privacy and free software that organizations can use to visualize this information so they can be held accountable to themselves, their employees, and the communities/customers they serve.

## Technical Section

### Installation
1. Clone/download repo
2. `yarn install` (or `npm install` for npm)

### Usage
**Development**

`yarn run start-dev`

* Build app continuously (HMR enabled)
* App served @ `http://localhost:8080`

**Production**

`yarn run start-prod`

* Build app once (HMR disabled) to `/dist/`
* App served @ `http://localhost:3000`

---

**All commands**

Command | Description
--- | ---
`yarn run start-dev` | Build app continuously (HMR enabled) and serve @ `http://localhost:8080`
`yarn run start-prod` | Build app once (HMR disabled) to `/dist/` and serve @ `http://localhost:3000`
`yarn run build` | Build app to `/dist/`
`yarn run test` | Run tests
`yarn run lint` | Run linter
`yarn run lint --fix` | Run linter and fix issues
`yarn run start` | (alias of `yarn run start-dev`)

**Note**: replace `yarn` with `npm` in `package.json` if you use npm.
