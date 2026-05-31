@react.component
let make = (~number: int=0) => {
  <div className={`relative flex min-h-dvh h-full justify-center items-center`}>
    <div className="container w-full h-full mx-auto flex  text-4xl ">
      {<Chip
        label={`Page ${Belt.Int.toString(number)}`} statusColor={GREEN} statusIndicator={true}
      />}
    </div>
  </div>
}
