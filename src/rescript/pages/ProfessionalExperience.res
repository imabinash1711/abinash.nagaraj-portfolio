let experienceData = [
  (
    "Accolite Digital — Senior Software Engineer",
    "Oct 2024 - Present",
    "Bengaluru, India",
    "Full-time",
    [
      (
        "FedEx — VisaPrime",
        [
          "Led Angular front-end for shipment tracking (10,000+/month) and invoice generation (5,000+/month) using NgRx & Angular Material — improved delivery accuracy 20%, reduced delays 15%.",
          "Architected VisaPrime JMS Service (Spring Boot) from scratch — TIBCO JMS simulator with TextMessage/BytesMessage, Okta JWT, and non-blocking async dispatch.",
          "Migrated monitoring from Splunk/AppDynamics to Dynatrace; authored DQL dashboards for real-time application & shipment visibility.",
        ],
        [
          "Angular",
          "NgRx",
          "RxJS",
          "Spring Boot",
          " JMS TIBCO",
          "Dynatrace DQL",
          "Okta JWT",
          "Oracle DB",
        ],
      ),
      (
        "Fiserv — Money Network",
        [
          "Built production-grade UIs for a high-traffic financial services platform with React.js, Redux Toolkit & TypeScript — accelerated delivery and reduced UI regression bugs.",
          "Integrated secure REST APIs with JWT auth for real-time financial data updates.",
          "Delivered responsive apps with Tailwind CSS and design tokens achieving a 30% increase in user satisfaction.",
        ],
        ["React.js", "Redux Toolkit", "TypeScript", "Tailwind CSS", "JWT", "Design Tokens"],
      ),
    ],
  ),
  (
    "Accolite Digital — Software Engineer",
    "Oct 2022 - Sep 2024",
    "Bengaluru, India",
    "Full-time",
    [
      (
        "FedEx — FPS (Flight Planning System)",
        [
          "Designed reusable Angular component libraries with ArcGIS map integrations — increased operational efficiency 25%, reduced UI dev time 30%.",
          "Built backend services for flight route management, invoicing, and shipment tracking (Java + Spring Boot) — improved system reliability 40%.",
          "Led Agile sprints with UX/QA; conducted code reviews across the Flight Planning platform.",
        ],
        ["Angular", "NgRx", "ArcGIS", "Java", "Spring Boot"],
      ),
      (
        "Juspay — NammaYatri",
        [
          "Built open data dashboards for Namma Yatri, Yatri Sathi, and Yatri — visualizing 1M+ rides, 100K+ driver payouts using React.js, ReScript & Highcharts.",
          "Aligned with Beckn Protocol / ONDC standards — improved data accessibility 30%.",
          "Delivered performant dashboards with Astro + Tailwind CSS.",
        ],
        ["React.js", "ReScript", "Highcharts", "Astro", "Tailwind CSS"],
      ),
      (
        "Juspay — Euler, EulerAdmin, Mobius",
        [
          "Led front-end for fintech analytics dashboards; built 10+ reusable components (charts, tables, filters).",
          "Optimized rendering — 20% increase in engagement; achieved 95% unit & integration test coverage.",
        ],
        ["ReScript", "React.js", "Webpack", "Mixpanel", "React Final Form"],
      ),
    ],
  ),
  (
    "Accolite Digital — Software Engineer Intern",
    "Feb 2022 - Sep 2022",
    "Bengaluru, India",
    "Internship",
    [
      (
        "",
        [
          "Built proficiency in React.js, Angular & Spring Boot through structured training and real-world project assignments.",
          "Delivered front-end and full-stack contributions to internal enterprise projects within an Agile team.",
        ],
        ["React.js", "Angular", "Java", "Spring Boot"],
      ),
    ],
  ),
]
module ExperienceCard = {
  @react.component
  let make = (
    ~companyProject: string,
    ~experience: array<string>,
    ~techStack: array<string>,
    ~isOpen: bool,
    ~setIsOpen: bool => unit,
  ) => {
    let isMobile = UseMobileView.use()
    <ResponsiveWrapper className="flex flex-col gap-2">
      {companyProject !== ""
        ? <ResponsiveWrapper.Header>
            <div
              className="flex gap-2 items-center justify-between px-6 py-4 rounded-lg border border-gray-500/25 hover:border-purple-500/25 bg-gray-500/10 hover:bg-purple-500/10 hover:shadow-sm hover:shadow-purple-500/25 cursor-pointer transition-all duration-300"
              onClick={_ => isMobile ? () : setIsOpen(!isOpen)}
            >
              <span className="flex gap-2 items-center font-semibold">
                <span className="size-2 rounded-full bg-purple-500" />
                {React.string(companyProject)}
              </span>
              <SvgIcon
                id="caret-down"
                size=16
                className={`transition-transform duration-300 ${if isOpen {
                    "rotate-180"
                  } else {
                    ""
                  }}`}
              />
            </div>
          </ResponsiveWrapper.Header>
        : React.null}
      {isOpen || isMobile
        ? <ResponsiveWrapper.Content>
            <div
              className="flex flex-col gap-2 px-6 py-3 rounded-lg border border-t-0 rounded-t-none border-gray-500/25 bg-gray-500/10 transition-all duration-300"
            >
              {experience
              ->Belt.Array.mapWithIndex((idx, experience) =>
                <div key={`Experience_${Belt.Int.toString(idx)}`} className="flex items-start gap-2">
                  <SvgIcon id="arrow-right" size=20 className="text-purple-500 fill-purple-500" />
                  <span className="opacity-50 text-sm"> {React.string(experience)} </span>
                </div>
              )
              ->React.array}
              <div className="flex flex-wrap gap-2 items-center">
                {Belt.Array.mapWithIndex(techStack, (index, skill) => {
                  <Chip key={`Skill_${Belt.Int.toString(index)}`} label=skill color=Chip.PURPLE />
                })->React.array}
              </div>
            </div>
          </ResponsiveWrapper.Content>
        : React.null}
    </ResponsiveWrapper>
  }
}

module ExperienceBox = {
  @react.component
  let make = (
    ~companyRole: string,
    ~duration: string,
    ~location: string,
    ~workType: string,
    ~experience: array<(string, array<string>, array<string>)>,
  ) => {
    let isMobile = UseMobileView.use()
    let (projectNo, setProjectNo) = React.useState(() => 0)
    <div
      className="flex flex-col gap-4 p-4 rounded-lg border border-gray-500/25 hover:border-purple-500/50 bg-gray-500/10 hover:shadow-sm hover:shadow-purple-500/25 transition-all duration-300"
    >
      <div className="flex md:flex-row flex-col-reverse gap-4 justify-between items-start">
        <div className="flex flex-col gap-1">
          <span className="font-semibold"> {React.string(companyRole)} </span>
          <span className="text-gray-500"> {React.string(location + " · " + workType)} </span>
        </div>
        <Chip label=duration color=Chip.PURPLE />
      </div>
      <div className="flex flex-col gap-4">
        {experience
        ->Belt.Array.mapWithIndex((index, (companyProject, projectExperience, techStack)) =>
          <ExperienceCard
            key={`ExperienceCard_${Belt.Int.toString(index)}`}
            companyProject=companyProject
            experience=projectExperience
            techStack=techStack
            isOpen={!isMobile && projectNo === index}
            setIsOpen={isOpen =>
              if isOpen {
                setProjectNo(_ => index)
              } else {
                setProjectNo(_ => -1)
              }}
          />
        )
        ->React.array}
      </div>
    </div>
  }
}

@react.component
let make = (
  ~data: (string, string, string, string, array<(string, array<string>, array<string>)>),
) => {
  <div
    className="relative flex flex-col justify-center gap-4 min-h-dvh h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div className="flex flex-col gap-2">
      <span className="font-mono text-purple-500"> {React.string("WHAT I'VE WORKED")} </span>
      <span className="text-2xl font-bold"> {React.string("Professional Experience")} </span>
      <span className="text-gray-500">
        {React.string(
          "Enterprise-scale delivery across fintech, logistics, and open mobility platforms.",
        )}
      </span>
    </div>
    <div className="flex flex-col gap-2">
      {
        let (companyRole, duration, location, workType, experience) = data

        <ExperienceBox
          companyRole=companyRole
          duration=duration
          location=location
          workType=workType
          experience=experience
        />
      }
    </div>
  </div>
}
