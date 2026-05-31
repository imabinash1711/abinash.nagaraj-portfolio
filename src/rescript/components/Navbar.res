let sectionTitles = [
  "Abinash Nagaraj",
  "Technical Skills",
  "Technical Skills",
  "Professional Experience",
  "Professional Experience",
  "Professional Experience",
  "Featured Projects",
  "Featured Projects",
  "Education",
  "Achievements",
  "Contact Me",
]

@react.component
let make = (~activeSection: int) => {
  let title = React.useMemo(() => {
    Belt.Array.get(sectionTitles, activeSection)->Belt.Option.getWithDefault("Abinash Nagaraj")
  }, [activeSection])

  <nav
    className="fixed h-15 w-full bg-taupe-900 text-gray-100 shadow-md border-taupe-500 shadow-taupe-500 z-10 px-10 py-2"
  >
    <div>
      <div className="flex text-2xl font-semibold">
        <p className="transition-all duration-300"> {React.string(title)} </p>
      </div>
    </div>
  </nav>
}
