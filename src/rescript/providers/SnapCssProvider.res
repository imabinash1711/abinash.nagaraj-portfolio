open SnapCssContext

module Provider = {
  let make = React.Context.provider(context)
}

@react.component
let make = (~css: string, ~children: React.element) => {
  let (className, setClassName) = React.useState(() => css)

  React.useEffect1(() => {
    setClassName(_ => css)

    None
  }, [css])

  let value: contextValue = {
    className,
    setClassName: str => setClassName(_ => str),
  }

  <Provider value={value}> {children} </Provider>
}
