module ScrabbleScore exposing (..)

scoreWord : String -> Int
scoreWord wordOrginal =

  --A, E, I, O, U, L, N, R, S, T       1
  --D, G                               2
  --B, C, M, P                         3
  --F, H, V, W, Y                      4
  --K                                  5
  --J, X                               8
  --Q, Z                               10

  let
    word = String.toLower wordOrginal
  in
    List.length (String.indexes "a" word) * 1 +
    List.length (String.indexes "e" word) * 1 +
    List.length (String.indexes "i" word) * 1 +
    List.length (String.indexes "o" word) * 1 +
    List.length (String.indexes "u" word) * 1 +
    List.length (String.indexes "l" word) * 1 +
    List.length (String.indexes "n" word) * 1 +
    List.length (String.indexes "r" word) * 1 +
    List.length (String.indexes "s" word) * 1 +
    List.length (String.indexes "t" word) * 1 +

    List.length (String.indexes "d" word) * 2 +
    List.length (String.indexes "g" word) * 2 +

    List.length (String.indexes "b" word) * 3 +
    List.length (String.indexes "c" word) * 3 +
    List.length (String.indexes "m" word) * 3 +
    List.length (String.indexes "p" word) * 3 +

    List.length (String.indexes "f" word) * 4 +
    List.length (String.indexes "h" word) * 4 +
    List.length (String.indexes "v" word) * 4 +
    List.length (String.indexes "w" word) * 4 +
    List.length (String.indexes "y" word) * 4 +

    List.length (String.indexes "k" word) * 5 +

    List.length (String.indexes "j" word) * 8 +
    List.length (String.indexes "x" word) * 8 +

    List.length (String.indexes "q" word) * 10 +
    List.length (String.indexes "z" word) * 10 +

    0
