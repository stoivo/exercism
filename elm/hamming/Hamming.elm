module Hamming exposing (..)
import Set exposing (toList, fromList)
import Char exposing (toCode)
import Array exposing (..)


distance: String -> String -> Maybe Int
distance a b =
  case (String.length a == String.length b) of
    True ->
      List.map2 (\l r -> l /= r) (String.toList a) (String.toList b)
        |> List.filter Basics.identity
        |> List.length
        |> Just
    False -> Nothing
