@react.component
let make = (
  ~icon: string,
  ~title: string,
  ~subtitle: string,
  ~description: string,
  ~stats: array<(string, string)>,
  ~chips: array<(string, string, Chip.color)>,
) => {
  <ResponsiveWrapper
    className="flex flex-col gap-4 p-4 rounded-lg border border-gray-500/25 hover:border-purple-500/50 bg-gray-500/10 hover:bg-purple-500/10 hover:shadow-sm hover:shadow-purple-500/25 hover:scale-102 transition-all duration-300"
  >
    <ResponsiveWrapper.Header>
      <div className="flex items-center gap-4">
        <div className="p-4 bg-purple-500/10 rounded-lg">
          <SvgIcon id=icon size=24 />
        </div>
        <div className="flex flex-col gap-2">
          <span className="text-purple-400"> {React.string(title)} </span>
          <span className="font-bold"> {React.string(subtitle)} </span>
        </div>
      </div>
    </ResponsiveWrapper.Header>
    <ResponsiveWrapper.Content>
      <span className="opacity-50"> {React.string(description)} </span>
      {stats->Belt.Array.length > 0
        ? <div className="flex gap-4">
            {Belt.Array.mapWithIndex(stats, (index, (value, label)) => {
              <div
                className="flex flex-col" id={`ProjectStatsCard_Item_${Belt.Int.toString(index)}`}
              >
                <span className="text-lg font-semibold text-purple-500">
                  {React.string(value)}
                </span>
                <span className="text-gray-400 uppercase"> {React.string(label)} </span>
              </div>
            })->React.array}
          </div>
        : React.null}
      {chips->Belt.Array.length > 0
        ? <div className="flex flex-wrap gap-2 items-center">
            {chips
            ->Array.mapWithIndex(((label, icon, color), index) =>
              <Chip
                key={`Chip_${label}_${Belt.Int.toString(index)}`}
                label=label
                color=color
                leftIcon=icon
              />
            )
            ->React.array}
          </div>
        : React.null}
    </ResponsiveWrapper.Content>
  </ResponsiveWrapper>
}
