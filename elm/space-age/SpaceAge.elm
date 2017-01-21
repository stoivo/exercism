module SpaceAge exposing (..)
import Dict exposing (Dict)

type Planet
  = Mercury
  | Venus
  | Earth
  | Mars
  | Jupiter
  | Saturn
  | Uranus
  | Neptune

earthSecunds = 31557600
ages =
    Dict.fromList
        [
          ( "Earth", 1.0 )
        , ( "Mercury", 0.2408467 )
        , ( "Venus", 0.61519726 )
        , ( "Mars", 1.8808158 )
        , ( "Jupiter", 11.862615 )
        , ( "Saturn", 29.447498 )
        , ( "Uranus", 84.016846 )
        , ( "Neptune", 164.79132 )
        ]


ageOn : Planet -> Int -> Float
ageOn planet seconds =
  case Dict.get planetToString planet ages of
    Just n ->
      toFloat seconds / earthSecunds / n
    Nothing -> 0


planetToString : Planet -> String
planetToString planet =
  case planet of
    Mercury -> "Mercury"
    Venus -> "Venus"
    Earth -> "Earth"
    Mars -> "Mars"
    Jupiter -> "Jupiter"
    Saturn -> "Saturn"
    Uranus -> "Uranus"
    Neptune -> "Neptune"
