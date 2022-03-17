class Medal < EnumerateIt::Base
  associate_values(
    gold: 1,
    silver: 2,
    bronze: 3
  )
end
