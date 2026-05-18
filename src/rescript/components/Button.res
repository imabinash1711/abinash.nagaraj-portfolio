type variant = FILLED | OUTLINE
type color = NONE | GREEN | PURPLE | BLUE | ORANGE

@react.component
let make = (
  ~color: color=NONE,
  ~variant: variant=FILLED,
  ~label: string,
  ~className: string="",
  ~onClick: option<unit => unit>=?,
  ~disabled: bool=false,
  ~leftIcon: string="",
  ~rightIcon: string="",
) => {
  let cursorClass = {
    let clickable = switch onClick {
    | Some(_) => "cursor-pointer select-none"
    | None => ""
    }
    let disabledClass = disabled ? "opacity-40 pointer-events-none" : ""
    `${clickable} ${disabledClass} select-none`
  }
  let colorClass = switch color {
  | NONE =>
    variant == FILLED
      ? "bg-gray-500 border-gray-500/10 hover:bg-gray-600"
      : "hover:bg-gray-500/10 hover:border-gray-500 hover:text-gray-400 hover:fill-gray-400 bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  | GREEN =>
    variant == FILLED
      ? "bg-green-500 border-green-500/10 hover:bg-green-600"
      : "hover:bg-green-500/10 hover:border-green-500 hover:text-green-400 hover:fill-green-400 bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  | PURPLE =>
    variant == FILLED
      ? "bg-purple-500 border-purple-500/10 hover:bg-purple-600"
      : "hover:bg-purple-500/10 hover:border-purple-500 hover:text-purple-400 hover:fill-purple-400 bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  | BLUE =>
    variant == FILLED
      ? "bg-blue-500 border-blue-500/10 hover:bg-blue-600"
      : "hover:bg-blue-500/10 hover:border-blue-500 hover:text-blue-400 hover:fill-blue-400 bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  | ORANGE =>
    variant == FILLED
      ? "bg-orange-500 border-orange-500/10 hover:bg-orange-600"
      : "hover:bg-orange-500/10 hover:border-orange-500 hover:text-orange-400 hover:fill-orange-400 bg-gray-500/10 border-gray-500/10 text-gray-400 fill-gray-400"
  }

  let handleClick = e => {
    switch (disabled, onClick) {
    | (false, Some(fn)) =>
      ReactEvent.Mouse.stopPropagation(e)
      ReactEvent.Mouse.preventDefault(e)
      fn()
    | _ => ()
    }
  }

  <div
    className={`flex gap-1.5 items-center justify-center px-4 py-1.5 border rounded-md size-fit text-sm font-semibold hover:scale-102 transition-all duration-200 ${colorClass} ${className} ${cursorClass}`}
    onClick=handleClick
  >
    {leftIcon != "" ? <SvgIcon id=leftIcon size=16 /> : React.null}
    <span className="whitespace-nowrap"> {React.string(label)} </span>
    {rightIcon != "" ? <SvgIcon id=rightIcon size=16 /> : React.null}
  </div>
}
