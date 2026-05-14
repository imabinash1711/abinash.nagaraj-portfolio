@react.component
let make = (
  ~id: string,
  ~size: int=24,
  ~className: string="",
  ~onClick: option<unit => unit>=?,
  ~disabled: bool=false,
) => {
  let sizeStr = Belt.Int.toString(size)

  let classNameStr = {
    let clickable = switch onClick {
    | Some(_) => "cursor-pointer select-none"
    | None => ""
    }
    let disabledClass = disabled ? "opacity-40 pointer-events-none" : ""
    `${clickable} ${className} ${disabledClass} select-none`
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

  <svg
    id={id}
    width={sizeStr}
    height={sizeStr}
    className={classNameStr}
    onClick={handleClick}
    ariaHidden={true}
  >
    <use href={`/assets/icons.svg#${id}`} />
  </svg>
}
