exception PopupProviderMissing

let use = () => {
  let ctx = React.useContext(PopupContext.context)
  switch ctx {
  | Some(c) => c
  | None => throw(PopupProviderMissing)
  }
}
