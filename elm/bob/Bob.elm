module Bob exposing (..)

hey : String -> String
hey name =
  --let
  --  chars = String.split "" name

  --in
  --  String.join "_" chars

    if String.isEmpty (String.trim name) then
      "Fine. Be that way!"
    else if question name then
      "Sure."
    else if shout name then
      "Whoa, chill out!"
    else
      "Whatever."

  --"Hello, " ++ name ++ "!"
  --case name of
  --  Just name ->
  --  Nothing -> "Hello, World!"

shout : String -> Bool
shout line =
  String.toUpper line == line && Basics.not (String.toLower line == line)

question : String -> Bool
question line =
  Basics.not (shout line) && String.right 1 line == "?"
