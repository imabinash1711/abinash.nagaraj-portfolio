open ThemeContext
module Provider = {
  let make = React.Context.provider(context)
}

module LocalStorage = LocalStorage

@val @scope(("window", "matchMedia"))
external matchMedia: string => {..} = "matchMedia"

@val @scope("document") external documentElement: {..} = "documentElement"

@react.component
let make = (~children) => {
  let (theme, setTheme) = React.useState(() => Light)
  let (isClient, setIsClient) = React.useState(() => false)

  React.useEffect0(() => {
    setIsClient(_ => true)

    switch LocalStorage.get("theme") {
    | Some("dark") => setTheme(_ => Dark)
    | Some("light") => setTheme(_ => Light)
    | Some(_) | None =>
      try {
        let darkModeQuery = matchMedia("(prefers-color-scheme: dark)")
        if darkModeQuery["matches"] {
          setTheme(_ => Dark)
        }
      } catch {
      | _ => ()
      }
    }
    None
  })

  React.useEffect1(() => {
    if isClient {
      let themeString = switch theme {
      | Dark => "dark"
      | Light => "light"
      }
      LocalStorage.set("theme", themeString)

      switch theme {
      | Dark => documentElement["classList"]["add"]("dark")
      | Light => documentElement["classList"]["remove"]("dark")
      }
    }
    None
  }, [theme])

  let toggleTheme = () => {
    setTheme(currentTheme => {
      switch currentTheme {
      | Light => Dark
      | Dark => Light
      }
    })
  }

  <Provider value={{theme, toggleTheme}}> {children} </Provider>
}
