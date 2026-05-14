module UseTheme = UseTheme
module ThemeContext = ThemeContext
module SvgIcon = SvgIcon

@react.component
let make = () => {
  let {theme, toggleTheme} = UseTheme.useTheme()

  let handleClick = _evt => {
    toggleTheme()
  }

  <button
    onClick={handleClick}
    className="fixed top-6 right-6 p-3 rounded-full bg-white dark:bg-gray-800 shadow-lg hover:shadow-xl transition-all duration-300 border-2 border-gray-200 dark:border-gray-700 z-50"
    ariaLabel="Toggle theme"
  >
    {switch theme {
    | ThemeContext.Dark => <SvgIcon id="sun" size=24 />
    | ThemeContext.Light => <SvgIcon id="moon" size=24 />
    }}
  </button>
}
