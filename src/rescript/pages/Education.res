@react.component
let make = () => {
  <div
    className="relative flex flex-col justify-center gap-8 min-h-screen h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div className="flex flex-col gap-2">
      <span className="font-mono text-purple-500"> {React.string("ACADEMIC BACKGROUND")} </span>
      <span className="text-2xl font-bold"> {React.string("Education")} </span>
      <span className="text-gray-500">
        {React.string("A strong engineering foundation underpinning every line of code I write.")}
      </span>
    </div>
    <Card
      icon="graduation-cap"
      title="Bachelor of Engineering"
      subtitle="Electronics & Communication Engineering"
      description="Thiagarajar College of Engineering, Madurai  ·  Anna University, Tamil Nadu"
      stats=[]
      chips=[("GPA: 9.05 / 10", "star", Chip.GREEN), ("Graduated 2022", "calendar", Chip.BLUE)]
    />
  </div>
}
