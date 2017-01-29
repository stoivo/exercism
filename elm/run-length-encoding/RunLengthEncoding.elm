module RunLengthEncoding exposing (..)

import Regex exposing (..)

version : Int
version =
  2

encode: String -> String
encode word =
  trEncode (String.split "" word) Nothing 0 ""

trEncode: List String -> Maybe String -> Int -> String -> String
trEncode remaining previusChar count word =
      case remaining of
        (char :: rema) ->
          if Just char == previusChar then
            trEncode rema previusChar (count + 1) word
          else
            case previusChar of
              Just previusCharT ->
                trEncode remaining (Just char) 0 (word ++ countToLetter previusCharT count)
              Nothing ->
                trEncode remaining (Just char) 0 word
        [] ->
            word ++ (countToLetter (Maybe.withDefault "" previusChar) count)

countToLetter: String -> Int -> String
countToLetter char number=
  case number of
    1 -> char
    _ -> (toString number) ++ char


decode: String -> String
decode word =
  Regex.find Regex.All (regex "(\\d*)([^\\d])") word
    |> List.map (\x -> decodeMatch x)
    |> String.join ""

decodeMatch: Match -> String
decodeMatch match =
  case match.submatches of
    (count :: letter :: _) -> repeatStr (Maybe.withDefault "0" count) (Maybe.withDefault " " letter)
    _ -> ""

repeatStr: String -> String -> String
repeatStr count letter =
  case String.toInt count of
    Err _ -> letter
    Ok i -> String.repeat i letter
