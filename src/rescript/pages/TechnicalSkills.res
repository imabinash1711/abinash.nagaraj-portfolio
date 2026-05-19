let skillsData = [
  (
    "code",
    "Languages",
    [
      ("TypeScript", Chip.PURPLE),
      ("JavaScript ES6+", Chip.PURPLE),
      ("HTML5", Chip.NONE),
      ("CSS3", Chip.NONE),
      ("ReScript", Chip.NONE),
    ],
  ),
  (
    "desktop",
    "Frontend",
    [
      ("React.js", Chip.PURPLE),
      ("Angular", Chip.PURPLE),
      ("NgRx", Chip.BLUE),
      ("Redux Toolkit", Chip.BLUE),
      ("RxJS", Chip.NONE),
      ("Tailwind CSS", Chip.NONE),
      ("Angular Material", Chip.NONE),
      ("Material UI", Chip.NONE),
    ],
  ),
  (
    "gear",
    "Backend",
    [
      ("Java", Chip.GREEN),
      ("Spring Boot", Chip.GREEN),
      ("Restful APIs", Chip.NONE),
      ("Microservices", Chip.NONE),
      ("JMS (TIBCO)", Chip.NONE),
    ],
  ),
  (
    "database",
    "Data & Messaging",
    [("Oracle DB", Chip.ORANGE), ("TIBCO JMS", Chip.GREEN), ("JWT / Okta", Chip.NONE)],
  ),
  (
    "tools",
    "Tools & Platforms",
    [
      ("Git / Github", Chip.NONE),
      ("Jira", Chip.NONE),
      ("Figma", Chip.NONE),
      ("Dynatrace", Chip.BLUE),
      ("Splunk", Chip.NONE),
      ("AppDynamics", Chip.NONE),
      ("Webpack", Chip.NONE),
      ("Postman", Chip.NONE),
    ],
  ),
  (
    "arrows-rotate",
    "Methodologies",
    [
      ("Agile / Scrum", Chip.PURPLE),
      ("CI / CD", Chip.NONE),
      ("WCAG Accesssibility", Chip.NONE),
      ("Code Review", Chip.NONE),
      ("Design Systems", Chip.NONE),
    ],
  ),
]

module SkillsCard = {
  @react.component
  let make = (~icon: string, ~label: string, ~skills: array<(string, Chip.color)>) => {
    <ResponsiveWrapper
      className="flex flex-col gap-4 p-6 rounded-lg border border-gray-500/25 hover:border-purple-500/25 bg-gray-500/10 hover:bg-purple-500/10 hover:shadow-sm hover:shadow-purple-500/25 hover:scale-102 cursor-pointer transition-all duration-300"
    >
      <ResponsiveWrapper.Header>
        <div className="flex gap-4 items-center">
          <SvgIcon id=icon size=20 />
          <span className="font-semibold"> {React.string(label)} </span>
        </div>
      </ResponsiveWrapper.Header>
      <ResponsiveWrapper.Content>
        <div className="flex flex-wrap gap-2 items-center">
          {Belt.Array.mapWithIndex(skills, (index, (skill, color)) => {
            <Chip key={`Skill_${Belt.Int.toString(index)}`} label=skill color=color />
          })->React.array}
        </div>
      </ResponsiveWrapper.Content>
    </ResponsiveWrapper>
  }
}

@react.component
let make = (~skills: array<(string, string, array<(string, Chip.color)>)>) => {
  <div
    className="relative flex flex-col justify-center gap-8 min-h-screen h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div className="flex flex-col gap-2">
      <span className="font-mono text-purple-500"> {React.string("WHAT I WORK WITH")} </span>
      <span className="text-2xl font-bold"> {React.string("Technical Skills")} </span>
      <span className="text-gray-500">
        {React.string(
          "A full-stack skill set spanning modern front-end frameworks, backend services, and enterprise tooling.",
        )}
      </span>
    </div>
    <div className="grid grid-cols-responsive-cards gap-5">
      {Belt.Array.mapWithIndex(skills, (index, (icon, label, skills)) => {
        <SkillsCard key={`SkillsCard_${Belt.Int.toString(index)}`} icon label skills />
      })->React.array}
    </div>
  </div>
}
