module ThemeProvider = ThemeProvider
module ThemeToggle = ThemeToggle

@react.component
let make = () => {
  <ThemeProvider>
    <div
      className="bg-white dark:bg-black text-gray-900 dark:text-gray-100 fill-gray-900 dark:fill-gray-100 min-h-screen transtion-all duration-300"
    >
      <ThemeToggle />
    </div>
  </ThemeProvider>
}
