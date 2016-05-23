(* Copyright (c) 2014 Sophia Donataccio, The MIT License (MIT) *)

val str =
  case CommandLine.arguments () of
    filename :: [] => filename
  | _ =>
    ( print ( "Usage: "
            ^ CommandLine.name ()
            ^ "<string>\n")
    ; OS.Process.exit OS.Process.failure)

fun makeStringReader str =
  let
    val size = String.size str
    fun reader (index, n) =
      let
        val rest = size - index
        fun readChar i = Byte.charToByte (String.sub (str, i + index))
      in
        if rest = 0 then (Word8Vector.tabulate(0, fn _ => 0w0), size)
        else if rest < n then (Word8Vector.tabulate(rest, readChar), size)
        else (* n >= rest *) (Word8Vector.tabulate(n, readChar), index + n)
      end
  in
    reader
  end


val hash = SHA1.sha1String (makeStringReader str) 0

val _ = print ("hash of " ^ "\"" ^ str ^ "\": " ^ hash ^ "\n")
