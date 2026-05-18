type color = NONE | GREEN | PURPLE | BLUE | ORANGE

@react.component
let make = (
  ~color: color=NONE,
  ~statusColor: option<color>=?,
  ~label: string,
  ~statusIndicator: bool=false,
  ~class: string="",
  ~leftIcon: string="",
  ~rightIcon: string="",
) => {
  let colorClass = switch color {
  | NONE => "bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  | GREEN => "bg-green-500/10 border-green-500/10 text-green-400 fill-green-400"
  | PURPLE => "bg-purple-500/10 border-purple-500/10 text-purple-400 fill-purple-400"
  | BLUE => "bg-blue-500/10 border-blue-500/10 text-blue-400 fill-blue-400"
  | ORANGE => "bg-orange-500/10 border-orange-500/10 text-orange-400 fill-orange-400"
  }

  let statusClass = switch Belt.Option.getWithDefault(statusColor, color) {
  | NONE => "bg-gray-400"
  | GREEN => "bg-green-400"
  | PURPLE => "bg-purple-400"
  | BLUE => "bg-blue-400"
  | ORANGE => "bg-orange-400"
  }
  <div
    className={`flex gap-1.5 items-center justify-center px-4 py-1.5 border rounded-full size-fit text-sm font-semibold ${colorClass} ${class}`}
  >
    {statusIndicator
      ? <span className="relative flex size-1.5">
          <span
            className={`absolute inline-flex h-full w-full animate-ping rounded-full ${statusClass} opacity-75`}
          >
          </span>
          <span className={`relative inline-flex size-1.5 rounded-full ${statusClass}`}></span>
        </span>
      : React.null}
    {leftIcon != "" ? <SvgIcon id=leftIcon size=16 /> : React.null}
    <span className="whitespace-nowrap"> {React.string(label)} </span>
    {rightIcon != "" ? <SvgIcon id=rightIcon size=16 /> : React.null}
  </div>
}
