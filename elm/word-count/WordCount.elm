module WordCount exposing (..)
import Dict exposing (Dict)
import Regex exposing (regex,replace, HowMany(All))

wordCount : String -> Dict String Int
wordCount line =
  line
    |> String.toLower
    |> Regex.find Regex.All (regex "([a-z0-9]+)")
    |> List.map .match
    |> List.foldr addWordCount Dict.empty


addWordCount : String -> Dict String Int -> Dict String Int
addWordCount word =
    Dict.update word incrementCount

incrementCount : Maybe Int -> Maybe Int
incrementCount n =
  case n of
    Nothing -> Just 1
    Just n  -> Just (n + 1)
