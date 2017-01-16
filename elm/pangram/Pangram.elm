module Pangram exposing (..)

import Set exposing (Set)
import Char

charRange : Char -> Char -> List Char
charRange start end =
  (List.range (Char.toCode start) (Char.toCode end)) |> List.map Char.fromCode


alphabet : Set Char
alphabet = Set.fromList (charRange 'a' 'z')


isPangram : String -> Bool
isPangram s =
  let
    letters = Set.fromList (String.toList (String.toLower s))
  in
    (Set.size (Set.intersect alphabet letters) == Set.size alphabet)
