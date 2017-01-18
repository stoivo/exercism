module Triangle exposing (..)

import Set exposing (fromList)

type Triangle
  = Equilateral
  | Isosceles
  | Scalene

triangleKind : Float -> Float -> Float -> Result String Triangle
triangleKind x y z =
  if x <= 0 || y <= 0 || z <= 0 then
    Err "Invalid lengths"
  else if x > y + z || y > x + z || z > x + y then
    Err "Violates inequality"
  else
    case Set.size (Set.fromList [ x, y, z ]) of
        1 -> Ok Equilateral
        2 -> Ok Isosceles
        _ -> Ok Scalene


-- after trouble with test i suppmitted a PR to  fix tests
-- https://github.com/exercism/xelm/pull/130


