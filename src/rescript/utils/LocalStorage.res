@val @scope("localStorage") external getItem: string => option<string> = "getItem"
@val @scope("localStorage") external setItem: (string, string) => unit = "setItem"
@val @scope("localStorage") external removeItem: string => unit = "removeItem"
@val @scope("localStorage") external clear: unit => unit = "clear"

let get = (key: string): option<string> => {
  try {
    getItem(key)
  } catch {
  | _ => None
  }
}

let set = (key: string, value: string): unit => {
  try {
    setItem(key, value)
  } catch {
  | _ => ()
  }
}

let remove = (key: string): unit => {
  try {
    removeItem(key)
  } catch {
  | _ => ()
  }
}

let clearAll = (): unit => {
  try {
    clear()
  } catch {
  | _ => ()
  }
}
