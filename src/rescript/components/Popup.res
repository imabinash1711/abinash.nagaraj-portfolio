@react.component
let make = () => {
  let {content, hidePopup, className} = UsePopup.use()
  let (isAnimating, setIsAnimating) = React.useState(() => false)

  let handleClose = () => {
    setIsAnimating(_ => false)
    let _ = setTimeout(() => hidePopup(), 500)
  }

  React.useEffect1(() => {
    let handleKeyDown = (e: ReactEvent.Keyboard.t) => {
      if e->ReactEvent.Keyboard.key == "Escape" {
        handleClose()
      }
    }
    Window.window->Window.addEventListener("keydown", handleKeyDown)
    Some(() => Window.window->Window.removeEventListener("keydown", handleKeyDown))
  }, [hidePopup])

  React.useEffect1(() => {
    switch content {
    | None => {
        setIsAnimating(_ => false)
        None
      }
    | Some(_) => {
        let timeoutId = setTimeout(() => setIsAnimating(_ => true), 10)
        Some(() => clearTimeout(timeoutId))
      }
    }
  }, [content])

  switch content {
  | None => React.null
  | Some(c) =>
    <div
      className="absolute backdrop-blur-xs inset-0 w-screen h-screen flex items-center justify-center z-50 transition-all ease-in-out duration-300"
      onClick={_ => handleClose()}
    >
      <div
        className={`fixed flex flex-col gap-4 items-center pb-15 overflow-auto max-h-3/4 shadow-gray-500 inset-x-0 bottom-0 p-4 mx-1 rounded-t-2xl shadow-lg transition-all ease-in-out duration-300 ${isAnimating
            ? "translate-y-0"
            : "translate-y-full"} ${className}`}
        onClick={e => ReactEvent.Mouse.stopPropagation(e)}
      >
        <div className="bg-gray-400/50 rounded-2xl w-20 h-1"></div>
        {c}
      </div>
    </div>
  }
}
