module DifferenceOfSquares exposing (..)

squareOfSum : Int -> Int
squareOfSum max =
  (List.foldr (\x b -> x + b) 0 (List.range 1 max)) ^ 2


sumOfSquares : Int -> Int
sumOfSquares max =
  List.foldr (\x b -> b + x ^ 2) 0 (List.range 1 max)


difference : Int -> Int
difference max =
  squareOfSum max - sumOfSquares max
