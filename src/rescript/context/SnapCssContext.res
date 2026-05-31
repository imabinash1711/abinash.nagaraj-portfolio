type contextValue = {
  className: string,
  setClassName: string => unit,
}

let context = React.createContext({
  className: "",
  setClassName: _ => (),
})
