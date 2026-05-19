open PopupContext

module Provider = {
  let make = React.Context.provider(context)
}

@react.component
let make = (~children: React.element) => {
  let (content, setContent) = React.useState(() => None)
  let (className, setClassName) = React.useState(() => "")

  let showPopup = (newContent: React.element) => setContent(_ => Some(newContent))
  let hidePopup = () => setContent(_ => None)

  let value: PopupContext.popupContextType = {
    content,
    className,
    setClassName: str => setClassName(_ => str),
    showPopup,
    hidePopup,
  }

  <Provider value={Some(value)}>
    {children}
    <Popup />
  </Provider>
}
