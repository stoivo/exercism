module RNATranscription exposing (toRNA)
import Dict exposing (Dict, fromList)


toRNA : String -> Result Char String
toRNA dna =
    dna
        |> String.toList
        |> List.map toRNANucleotide
        |> resultExtraCombine
        |> Result.map (List.map String.fromChar)
        |> Result.map (String.join "")

-- Copied from elm-result-extra


resultExtraCombine : List (Result x a) -> Result x (List a)
resultExtraCombine =
    List.foldr (Result.map2 (::)) (Ok [])


metches: Dict Char Char
metches =
  Dict.fromList([
      ('G','C')
     ,('C','G')
     ,('T','A')
     ,('A','U')
    ])

toRNANucleotide: Char -> Result Char Char
toRNANucleotide orignalLetter =
  case Dict.get orignalLetter metches of
    Just x -> Ok x
    Nothing -> Err orignalLetter

