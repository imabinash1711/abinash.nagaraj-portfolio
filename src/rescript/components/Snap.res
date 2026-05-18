@react.component
let make = (~children: React.element) => {
  <div className="snap-y snap-mandatory overflow-y-scroll h-screen scrollbar-none">
    {children
    ->React.Children.toArray
    ->Belt.Array.mapWithIndex((index, child) => {
      let oddClass = "odd:bg-stone-900 odd:text-gray-100 odd:fill-gray-100"
      let evenClass = "even:bg-stone-100 even:text-gray-900 even:fill-gray-900"
      <div
        key={`Snap_Child_${Belt.Int.toString(index)}`}
        className={` ${evenClass} ${oddClass} snap-always snap-center `}
      >
        {child}
      </div>
    })
    ->React.array}
  </div>
}
