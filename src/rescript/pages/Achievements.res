let achievementsData: array<(
  string,
  string,
  string,
  string,
  array<(string, string)>,
  array<(string, string, Chip.color)>,
)> = [
  (
    "puzzle-piece",
    "Problem Solving — 400+ DSA",
    "",
    "Solved 400+ coding problems across GeeksForGeeks and LeetCode, demonstrating strong proficiency in data structures and algorithms.",
    [],
    [],
  ),
  (
    "trophy",
    "Intern Leadership",
    "",
    "Led a team of software engineering interns to design and deliver a reusable internal component library adopted across multiple production projects.",
    [],
    [],
  ),
  (
    "puzzle-piece",
    "Technical Hiring — 20+ Interviews",
    "",
    "Conducted 20+ technical interviews for software engineering roles, actively contributing to talent acquisition and team building at Accolite.",
    [],
    [],
  ),
]
@react.component
let make = () => {
  <div
    className="relative flex flex-col justify-center gap-8 min-h-dvh h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div className="flex flex-col gap-2">
      <span className="font-mono text-purple-500"> {React.string("BEYOND THE CODE")} </span>
      <span className="text-2xl font-bold"> {React.string("Achievements")} </span>
      <span className="text-gray-500">
        {React.string(
          "Highlights that reflect discipline, leadership, and a drive to keep improving.",
        )}
      </span>
    </div>
    <div className="grid grid-cols-responsive-cards gap-5">
      {achievementsData
      ->Belt.Array.mapWithIndex((index, (icon, title, subtitle, description, stats, chips)) =>
        <Card
          key={`Achievement_${Belt.Int.toString(index)}`}
          icon=icon
          title=title
          subtitle=subtitle
          description=description
          stats=stats
          chips=chips
        />
      )
      ->React.array}
    </div>
  </div>
}
