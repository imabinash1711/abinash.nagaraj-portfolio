@val
external openWindow: (string, string) => unit = "open"

module StatsCard = {
  @react.component
  let make = (~items: array<(string, string)>) => {
    <>
      {Belt.Array.mapWithIndex(items, (index, (label, value)) => {
        <div key={`StatsCard_Item_${Belt.Int.toString(index)}`} className="flex flex-col">
          <span className="md:text-4xl text-2xl font-bold">
            {React.string(value)}
            <span className="text-purple-500"> {React.string("+")} </span>
          </span>
          <span className="text-gray-400 font-semibold whitespace-pre-line">
            {React.string(label)}
          </span>
        </div>
      })->React.array}
    </>
  }
}

module ListItems = {
  @react.component
  let make = (~items: array<(string, string)>) => {
    <>
      {Belt.Array.mapWithIndex(items, (index, (icon, value)) => {
        <div
          key={`ListItem_${Belt.Int.toString(index)}`}
          className="flex gap-4 items-center text-gray-400"
        >
          <SvgIcon id=icon size=28 className="border border-gray-400/50 rounded-md p-1" />
          <span className="value"> {React.string(value)} </span>
        </div>
      })->React.array}
    </>
  }
}

module ProfileCard = {
  @react.component
  let make = () => {
    let listItems = [
      ("location", "Bengaluru, India"),
      ("graduation-cap", "B.E. ECE — GPA 9.05"),
      ("briefcase", "Accolite Digital, Oct 2022"),
      ("phone", "+91 733-930-4118"),
    ]

    let skills = ["React.js", "Angular", "TypeScript", "Spring Boot", "NgRx"]
    <div
      className="bg-gray-900/10 border border-gray-400/50 border-t-4 border-t-purple-500 rounded-3xl p-6 w-full h-full flex flex-col gap-4 shadow-md"
    >
      <div
        className="flex items-center justify-center border-2 border-purple-500 rounded-full size-20 self-center text-4xl font-bold text-purple-300"
      >
        {React.string("AN")}
      </div>
      <span className="text-center text-xl font-semibold"> {React.string("Abinash Nagaraj")} </span>
      <span className="text-center text-purple-300">
        {React.string("Senior Software Engineer @ Accolite")}
      </span>
      <div className="flex flex-col gap-4">
        <ListItems items=listItems />
      </div>
      <div className="flex flex-wrap gap-2 items-center justify-center">
        {Belt.Array.mapWithIndex(skills, (index, skill) => {
          <Chip key={`Skill_${Belt.Int.toString(index)}`} label=skill />
        })->React.array}
      </div>
    </div>
  }
}

@react.component
let make = () => {
  let handleClick = _event => {
    let email = "abinash.nagaraj.official@gmail.com"
    openWindow(`mailto:${email}`, "_self")
  }

  let handleGitHubClick = _event => {
    openWindow("https://github.com/imabinash1711", "_blank")
  }

  let statsItems = [
    ("YEARS\n EXP.", "4"),
    ("Enterprise\n Clients", "5"),
    ("DSA\n Problems", "400"),
    ("Interviews\n Taken", "20"),
  ]

  <div
    className="relative flex flex-col justify-center gap-4 min-h-dvh h-full md:px-10 px-5 pt-18 pb-3"
  >
    <Chip label="Available for new opportunities" statusIndicator=true statusColor=GREEN />
    <div className="flex">
      <div className="flex flex-col md:gap-6 gap-4 md:w-3/5 w-full md:pr-10">
        <span className="text-5xl font-bold"> {React.string("Abinash N")} </span>
        <span className="text-gray-400 font-semibold">
          <span className="text-purple-300"> {React.string("Senior Software Engineer")} </span>
          {React.string(" — React · Angular · Spring Boot")}
        </span>
        <span className="text-gray-400">
          {React.string(
            "4+ years building high-performance, accessible front-end applications for enterprise clients in fintech, logistics, and mobility. I ship fast, code clean, and obsess over user experience.",
          )}
        </span>
        <div className="flex gap-6">
          <Button
            label="Get in Touch" color=PURPLE variant=FILLED leftIcon="envelope" onClick=handleClick
          />
          <Button
            label="View GitHub"
            color=PURPLE
            variant=OUTLINE
            leftIcon="github"
            onClick=handleGitHubClick
          />
        </div>
        <div className="border-b border-gray-400/10 md:py-6 py-4" />
        <div className="flex gap-4 justify-between items-center">
          <StatsCard items=statsItems />
        </div>
      </div>
      <div className="w-2/5 min-w-2xs md:flex hidden">
        <ProfileCard />
      </div>
    </div>
  </div>
}
