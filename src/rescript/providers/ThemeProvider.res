open ThemeContext
module Provider = {
  let make = React.Context.provider(context)
}

@react.component
let make = (~children) => {
  let (theme, setTheme) = React.useState(() => Light)

  let toggleTheme = () => {
    setTheme(currentTheme => {
      switch currentTheme {
      | Light => Dark
      | Dark => Light
      }
    })
  }

  let className = switch theme {
  | Dark => "dark"
  | Light => ""
  }

  <Provider value={{theme, toggleTheme}}>
    <div className> {children} </div>
  </Provider>
}
