let mobileBreakpoint = 768

let use = () => {
  let (isMobile, setIsMobile) = React.useState(() => None)

  React.useEffect0(() => {
    let mql =
      Window.window->Window.matchMedia(`(max-width: ${(mobileBreakpoint - 1)->Int.toString}px)`)
    let onChange = _ => {
      setIsMobile(_ => Some(Window.window->Window.innerWidth < mobileBreakpoint))
    }
    mql->Window.addEventListener("change", onChange)
    setIsMobile(_ => Some(Window.window->Window.innerWidth < mobileBreakpoint))
    Some(() => mql->Window.removeEventListener("change", onChange))
  })

  switch isMobile {
  | Some(v) => v
  | None => false
  }
}
