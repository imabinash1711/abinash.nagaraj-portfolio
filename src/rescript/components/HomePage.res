@react.component
let make = () => {
  // <ThemeProvider>
  <PopupProvider>
    <div
      className="font-inter overflow-hidden bg-white dark:bg-black text-gray-900 dark:text-gray-100 fill-gray-900 dark:fill-gray-100 min-h-dvh transtion-all duration-300"
    >
      <Navbar />
      <Snap>
        <Summary />
        <TechnicalSkills skills={Belt.Array.slice(TechnicalSkills.skillsData, ~offset=0, ~len=3)} />
        <TechnicalSkills skills={Belt.Array.slice(TechnicalSkills.skillsData, ~offset=3, ~len=6)} />
        {ProfessionalExperience.experienceData
        ->Belt.Array.mapWithIndex((index, data) => {
          <ProfessionalExperience key={`ProfessionalExperience${Belt.Int.toString(index)}`} data />
        })
        ->React.array}
        <FeaturedProjects
          projects={Belt.Array.slice(FeaturedProjects.projectsData, ~offset=0, ~len=3)}
        />
        <FeaturedProjects
          projects={Belt.Array.slice(FeaturedProjects.projectsData, ~offset=3, ~len=6)}
        />
        <Education />
        <Achievements />
        <ContactUs />
      </Snap>
    </div>
  </PopupProvider>
  // </ThemeProvider>
}
