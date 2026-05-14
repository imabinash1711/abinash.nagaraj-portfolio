type theme = Dark | Light

type contextValue = {
  theme: theme,
  toggleTheme: unit => unit,
}

let context = React.createContext({
  theme: Light,
  toggleTheme: () => (),
})
