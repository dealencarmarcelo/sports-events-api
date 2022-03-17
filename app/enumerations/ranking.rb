class Ranking < EnumerateIt::Base
  associate_values(
    :final,
    :partial
  )
end
