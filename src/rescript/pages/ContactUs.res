@val
external openWindow: (string, string) => unit = "open"

@react.component
let make = () => {
  let handleMailClick = _event => {
    let email = "abinash.nagaraj.official@gmail.com"
    openWindow(`mailto:${email}`, "_self")
  }

  let handlePhoneClick = _event => {
    let phone = "+91 733-930-4118"
    openWindow(`tel:${phone}`, "_self")
  }

  let handleGitHubClick = _event => {
    openWindow("https://github.com/imabinash1711", "_blank")
  }

  let handleLinkedInClick = _event => {
    openWindow("https://www.linkedin.com/in/abinash-nagaraj", "_blank")
  }

  <div
    className="relative flex flex-col justify-between gap-4 min-h-screen h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div />
    <div
      className="flex flex-col items-center gap-4 p-4 rounded-lg border border-gray-500/25 hover:border-purple-500/50 bg-gray-500/10 hover:shadow-sm hover:shadow-purple-500/25 transition-all duration-300"
    >
      <span className="font-mono text-purple-500"> {React.string("LET'S CONNECT")} </span>
      <span className="text-2xl font-bold"> {React.string("Open to Opportunities")} </span>
      <span className="text-gray-500">
        {React.string(
          "Whether it's a new role, a collaboration, or just a chat — feel free to reach out.",
        )}
      </span>
      <div className="flex flex-wrap gap-4 items-center justify-center">
        {[
          ("envelope", "abinash.nagaraj.official@gmail.com", handleMailClick),
          ("phone", "+91 733-930-4118", handlePhoneClick),
          ("linkedin", "abinash-nagaraj", handleLinkedInClick),
          ("github", "abinash-nagaraj", handleGitHubClick),
        ]
        ->Belt.Array.mapWithIndex((index, (icon, label, onClick)) =>
          <Button
            key={`ContactUs_Button_${Belt.Int.toString(index)}`}
            label=label
            color=Button.PURPLE
            leftIcon=icon
            variant={Button.OUTLINE}
            onClick=onClick
          />
        )
        ->React.array}
      </div>
    </div>
    <div className="flex flex-col items-center gap-4 text-gray-500">
      <div className="border-b border-gray-400/10 md:py-6 py-10 w-full" />
      <span> {React.string("© 2026 Abinash Nagaraj — All rights reserved.")} </span>
      <span> {React.string("Designed & built with ♡ in Bengaluru, India.")} </span>
    </div>
  </div>
}
