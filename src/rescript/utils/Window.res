type window
type element
type intersectionObserver
type timeoutId
type intersectionObserverEntry = {
  "isIntersecting": bool,
  "target": element,
}

@val external window: window = "window"
@get external innerWidth: window => int = "innerWidth"
@send external matchMedia: (window, string) => window = "matchMedia"
@send
external addEventListener: (window, string, JsxEvent.synthetic<'a> => unit) => unit =
  "addEventListener"
@send
external removeEventListener: (window, string, JsxEvent.synthetic<'a> => unit) => unit =
  "removeEventListener"

@val external document: element = "document"
@send external querySelectorAll: (element, string) => array<element> = "querySelectorAll"
@send external getElementById: (element, string) => option<element> = "getElementById"
@send external getAttribute: (element, string) => option<string> = "getAttribute"
@get external getId: element => option<string> = "id"
@send external setAttribute: (element, string, string) => unit = "setAttribute"
@send external scrollTo: (window, {"top": int, "behavior": string}) => unit = "scrollTo"
@send external scrollIntoView: (element, {"behavior": string, "block": string}) => unit = "scrollIntoView"

@val external setTimeout: (unit => unit, int) => timeoutId = "setTimeout"
@val external clearTimeout: timeoutId => unit = "clearTimeout"

@new
external createIntersectionObserver: (
  (array<intersectionObserverEntry>, intersectionObserver) => unit,
  {"root": Nullable.t<element>, "rootMargin": string, "threshold": float},
) => intersectionObserver = "IntersectionObserver"

@send external observe: (intersectionObserver, element) => unit = "observe"
@send external disconnect: (intersectionObserver, unit) => unit = "disconnect"
