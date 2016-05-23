(* Copyright (c) 2014 Sohpia Donataccio, The MIT License (MIT) *)

val hashFile = "correct-hashes.txt"

fun splitLine line =
  case String.tokens Char.isSpace line of
    hash :: filename :: [] => (hash, filename)
  | _ => raise (Fail "hashFile not formatted corrected")

fun readHashes filename =
  let
    val fstream = TextIO.openIn filename
    fun loop lst =
      case TextIO.inputLine fstream of
        NONE => ( TextIO.closeIn fstream
                ; List.rev lst
                )
      | SOME line => loop ((splitLine line) :: lst)
  in
    loop []
  end

val checkList = readHashes hashFile

fun areHashesCorrect lst =
  case lst of
    [] => true
  | (correctHash, filename) :: rest =>
    let
      val fstream = BinIO.openIn filename
        (* We need the functional version of the input stream *)
      val fstream' = BinIO.getInstream fstream
      val calculatedHash = SHA1.sha1String BinIO.StreamIO.inputN fstream'
      val _ = BinIO.closeIn fstream
    in
      if correctHash = calculatedHash then
        ( print (filename ^ ": OK\n")
        ; areHashesCorrect rest
        )
      else
        ( print (filename ^ ": Incorrect hash\n")
        ; false
        )
    end

val _ =
  if areHashesCorrect checkList
  then (print "All tests passed.\n"; OS.Process.exit OS.Process.success)
  else (print "A test failed.\n"; OS.Process.exit OS.Process.failure)
