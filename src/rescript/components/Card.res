let parseMarkdownLinks = (text: string): React.element => {
  let linkPattern = /\[([^\]]+)\]\(([^)]+)\)/

  let rec parse = (remaining: string, acc: list<React.element>, key: int): list<React.element> => {
    switch linkPattern->RegExp.exec(remaining) {
    | Some(result) => {
        let matchIndex = result->RegExp.Result.index
        let fullMatch = result->RegExp.Result.fullMatch

        // Extract link text and URL from the full match
        let linkText = {
          let startBracket = String.indexOf(fullMatch, "[")
          let endBracket = String.indexOf(fullMatch, "]")
          if startBracket >= 0 && endBracket > startBracket {
            Js.String.substring(~from=startBracket + 1, ~to_=endBracket, fullMatch)
          } else {
            ""
          }
        }

        let url = {
          let startParen = String.indexOf(fullMatch, "(")
          let endParen = String.indexOf(fullMatch, ")")
          if startParen >= 0 && endParen > startParen {
            Js.String.substring(~from=startParen + 1, ~to_=endParen, fullMatch)
          } else {
            ""
          }
        }

        let newElements = if matchIndex > 0 {
          let beforeText = Js.String.substring(~from=0, ~to_=matchIndex, remaining)
          list{
            <React.Fragment key={`text-${Belt.Int.toString(key)}`}>
              {React.string(beforeText)}
            </React.Fragment>,
          }
        } else {
          list{}
        }

        let linkElement = list{
          <a
            key={`link-${Belt.Int.toString(key + 1)}`}
            href={url}
            target="_blank"
            rel="noopener noreferrer"
            className="text-purple-500 hover:text-purple-600 underline"
          >
            {React.string(linkText)}
          </a>,
        }

        let afterIndex = matchIndex + String.length(fullMatch)
        let afterText = Js.String.substringToEnd(~from=afterIndex, remaining)

        parse(afterText, Belt.List.concatMany([acc, newElements, linkElement]), key + 2)
      }
    | None => if String.length(remaining) > 0 {
        Belt.List.concat(
          acc,
          list{
            <React.Fragment key={`text-${Belt.Int.toString(key)}`}>
              {React.string(remaining)}
            </React.Fragment>,
          },
        )
      } else {
        acc
      }
    }
  }

  let elements = parse(text, list{}, 0)

  if Belt.List.length(elements) == 0 {
    React.string(text)
  } else {
    <> {React.array(Belt.List.toArray(elements))} </>
  }
}

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
      <span className="opacity-50"> {parseMarkdownLinks(description)} </span>
      {stats->Belt.Array.length > 0
        ? <div className="flex gap-4">
            {Belt.Array.mapWithIndex(stats, (index, (value, label)) => {
              <div
                key={`ProjectStatsCard_Item_${Belt.Int.toString(index)}`}
                className="flex flex-col"
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
