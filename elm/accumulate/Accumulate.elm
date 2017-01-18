module Accumulate exposing (..)

accumulate : (a -> a) -> List a -> List a
accumulate func data =
    case data of
      [] -> []
      (x::xs) -> (func x) :: (accumulate func xs)

