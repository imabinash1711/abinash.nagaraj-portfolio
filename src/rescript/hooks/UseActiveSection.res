let use = () => {
  let (activeSection, setActiveSection) = React.useState(() => 0)

  React.useEffect(() => {
    // Set up Intersection Observer
    let options = {
      "root": Nullable.null,
      "rootMargin": "0px",
      "threshold": 0.5,
    }

    let callback = (entries, _observer) => {
      entries->Array.forEach(entry => {
        if entry["isIntersecting"] {
          let target = entry["target"]
          let elementId = target->Window.getId
          switch elementId {
          | Some(id) =>
            // Extract index from "section-0", "section-1", etc.
            let indexStr = id->String.replace("section-", "")
            switch Belt.Int.fromString(indexStr) {
            | Some(idx) => setActiveSection(_ => idx)
            | None => ()
            }
          | None => ()
          }
        }
      })
    }

    let observer = Window.createIntersectionObserver(callback, options)

    // Observe all section containers
    let sections = Window.document->Window.querySelectorAll("[id^='section-']")
    sections->Array.forEach(section => {
      observer->Window.observe(section)
    })

    // Cleanup
    Some(
      () => {
        observer->Window.disconnect()
      },
    )
  }, [])

  activeSection
}
