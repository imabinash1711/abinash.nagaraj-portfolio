let projectsData = [
  (
    "truck-fast",
    "FedEx · VisaPrime",
    "Shipment Tracking Platform",
    "Angular front-end powering real-time shipment tracking and commercial invoice generation at scale, backed by NgRx state management and Oracle DB.",
    [("10K+", "Shipments"), ("+20%", "Delivery accuracy"), ("-15%", "Delays")],
    ["Angular", "NgRx", "Oracle DB"],
  ),
  (
    "gear",
    "FedEx · VisaPrime",
    "VisaPrime JMS Service",
    "Spring Boot microservice built from scratch — a TIBCO JMS message simulator supporting TextMessage/BytesMessage with Okta JWT security and non-blocking async dispatch.",
    [("0 → 1", "Built from scratch"), ("Async", "Non-blocking")],
    ["Spring Boot", "TIBCO JMS", "Okta JWT"],
  ),
  (
    "car",
    "Juspay · NammaYatri",
    "Open Mobility Dashboards",
    "Public data dashboards for [Namma Yatri](https://nammayatri.in/), [Yatri Sathi](https://yatrisathi.in/) and [Yatri](https://getyatri.com/) — visualizing ride data, driver payouts, and cancellations in real-time. Aligned to ONDC/Beckn Protocol.",
    [("1M+", "Rides visualized"), ("100K+", "Driver payouts")],
    ["React.js", "ReScript", "Highcharts", "Astro"],
  ),
  (
    "cash-app",
    "Fiserv · Money Network",
    "Financial Services UI Platform",
    "Production-grade React + Redux application for a high-traffic financial services platform with real-time data, JWT auth, and a component library built on design tokens.",
    [("+30%", "User satisfaction"), ("High", "Traffic platform")],
    ["React.js", "Redux Toolkit", "Design Tokens"],
  ),
  (
    "plane-departure",
    "FedEx · FPS",
    "Flight Planning System",
    "Reusable Angular component library for aviation flight planning with advanced ArcGIS map integrations. Backed by Spring Boot services for route management and invoicing.",
    [("+25%", "Efficiency"), ("+40%", "Reliability")],
    ["Angular", "ArcGIS", "Spring Boot"],
  ),
  (
    "chart-simple",
    "Juspay · Euler / Mobius",
    "Fintech Analytics Dashboards",
    "Internal fintech and mobility analytics platforms with 10+ reusable charting components. 95% test coverage and a 20% boost in user engagement through rendering optimisation.",
    [("95%", "Test coverage"), ("+20%", "Engagement")],
    ["React.js", "ReScript", "Highcharts"],
  ),
]

@react.component
let make = (
  ~projects: array<(string, string, string, string, array<(string, string)>, array<string>)>,
) => {
  <div
    className="relative flex flex-col justify-center gap-8 min-h-dvh h-full md:px-10 px-5 pt-18 pb-3"
  >
    <div className="flex flex-col gap-2">
      <span className="font-mono text-purple-500"> {React.string("THINGS I'VE SHIPPED")} </span>
      <span className="text-2xl font-bold"> {React.string("Featured Projects")} </span>
      <span className="text-gray-500">
        {React.string("Enterprise-grade systems and dashboards with measurable real-world impact.")}
      </span>
    </div>
    <div className="grid grid-cols-responsive-cards gap-5">
      {Belt.Array.mapWithIndex(projects, (
        index,
        (icon, title, subtitle, description, stats, techStack),
      ) => {
        <Card
          key={`ProjectCard_${Belt.Int.toString(index)}`}
          icon
          title
          subtitle
          description
          stats
          chips={techStack->Belt.Array.map(tech => (tech, "", Chip.PURPLE))}
        />
      })->React.array}
    </div>
  </div>
}
