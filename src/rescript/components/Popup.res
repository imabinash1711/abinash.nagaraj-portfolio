@react.component
let make = () => {
  let {content, hidePopup, className} = UsePopup.use()

  React.useEffect1(() => {
    let handleKeyDown = (e: ReactEvent.Keyboard.t) => {
      if e->ReactEvent.Keyboard.key == "Escape" {
        hidePopup()
      }
    }
    Window.window->Window.addEventListener("keydown", handleKeyDown)
    Some(() => Window.window->Window.removeEventListener("keydown", handleKeyDown))
  }, [hidePopup])

  switch content {
  | None => React.null
  | Some(c) =>
    <div className="fixed inset-0 flex items-center justify-center z-50" onClick={_ => hidePopup()}>
      <div
        className={`bg-gray-100 dark:bg-neutral-950 text-light-black dark:text-white p-6 rounded-2xl shadow-xl max-w-md w-full transition transform duration-200 scale-100 ${className}`}
        onClick={e => ReactEvent.Mouse.stopPropagation(e)}
      >
        {c}
      </div>
    </div>
  }
}
