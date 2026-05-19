type popupContextType = {
  content: option<React.element>,
  className: string,
  setClassName: string => unit,
  showPopup: React.element => unit,
  hidePopup: unit => unit,
}

let context: React.Context.t<option<popupContextType>> = React.createContext(None)
