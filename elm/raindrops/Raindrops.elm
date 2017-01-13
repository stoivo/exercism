module Raindrops exposing (..)

type alias State = {
  isByThree : Bool
 ,isByFive : Bool
 ,isBySeven : Bool
 ,number : Int
}


raindrops : Int -> String
raindrops number =
  let
    stuff = findState number
  in
    getStringFromState stuff



findState : Int -> State
findState number =
  let
    isByThree = byThree number
    isByFive = byFive number
    isBySeven = bySeven number
  in
    State isByThree isByFive isBySeven number


byThree : Int -> Bool
byThree num =
  num % 3 == 0

byThreeStr : Bool -> String
byThreeStr is =
  case is of
    True -> "Pling"
    False -> ""

byFive : Int -> Bool
byFive num =
  num % 5 == 0

byFiveStr : Bool -> String
byFiveStr is =
  case is of
    True -> "Plang"
    False -> ""

bySeven : Int -> Bool
bySeven num =
  num % 7 == 0

bySevenStr : Bool -> String
bySevenStr is =
  case is of
    True -> "Plong"
    False -> ""

getStringFromState : State -> String
getStringFromState bar =
  let
    stingsToJoin = [
      byThreeStr (bar.isByThree)
    , byFiveStr (bar.isByFive)
    , bySevenStr (bar.isBySeven)
    ]
  in
    String.join "" (maybeAddNumber bar.number stingsToJoin)

maybeAddNumber : Int -> List String -> List String
maybeAddNumber number strings =
  if List.isEmpty (List.filter stringNotIsEmpty strings) then
    [toString number]
  else
    strings

stringNotIsEmpty : String -> Bool
stringNotIsEmpty str =
  Basics.not (String.isEmpty str)
