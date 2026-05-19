@get external elementType: 'a => 'b = "type"

let isType = (element: React.element, make: 'a): bool => {
  Object.is(element->elementType, make)
}

module Header = {
  @react.component
  let make = (~children: React.element) => children
}

module Content = {
  @react.component
  let make = (~children: React.element) => children
}

@react.component
let make = (~children: React.element, ~className: string="") => {
  let isMobile = UseMobileView.use()
  let {showPopup} = UsePopup.use()

  let childArr = React.Children.toArray(children)

  let header =
    childArr
    ->Belt.Array.getBy(el => isType(el, Header.make))
    ->Option.getOr(React.null)

  let content =
    childArr
    ->Belt.Array.getBy(el => isType(el, Content.make))
    ->Option.getOr(React.null)

  let showPopup = () => {
    if isMobile && header != React.null {
      showPopup(
        <div className={className}>
          {header}
          {content}
        </div>,
      )
    }
  }
  <div className={className} onClick={_ => showPopup()}>
    {header}
    {!isMobile || header == React.null ? content : React.null}
  </div>
}
