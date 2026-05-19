type window

@val external window: window = "window"
@get external innerWidth: window => int = "innerWidth"
@send external matchMedia: (window, string) => window = "matchMedia"
@send
external addEventListener: (window, string, JsxEvent.synthetic<'a> => unit) => unit =
  "addEventListener"
@send
external removeEventListener: (window, string, JsxEvent.synthetic<'a> => unit) => unit =
  "removeEventListener"
