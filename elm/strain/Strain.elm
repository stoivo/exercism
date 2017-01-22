module Strain exposing (..)

keep : (a -> Bool) -> List a -> List a
keep operation =
  trKeep [] operation

discard : (a -> Bool) -> List a -> List a
discard operation =
  trKeep [] (not << operation)

trKeep : List a -> (a -> Bool) -> List a -> List a
trKeep acc operation xs =
  case xs of
    [] ->
      acc |> List.reverse

    x::xs ->
      if operation x then
        trKeep (x :: acc) operation xs
      else
        trKeep (     acc) operation xs
