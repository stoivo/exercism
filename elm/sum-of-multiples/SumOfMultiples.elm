module SumOfMultiples exposing (..)
import Set exposing (fromList, toList)


findMatches: Int -> Int -> List Int
findMatches max multiplier =
  trFindMatches [] max 1 multiplier

trFindMatches: List Int -> Int -> Int -> Int -> List Int
trFindMatches sum max counter multiplier =
  let
    number = multiplier * counter
  in
    if number < max then
      trFindMatches (number :: sum) max (counter + 1) multiplier
    else
      sum


sumOfMultiples: List Int -> Int -> Int
sumOfMultiples numbers max =
  numbers
    |> List.map (findMatches max)
    |> List.concat
    |> Set.fromList
    |> Set.toList
    |> List.sum
