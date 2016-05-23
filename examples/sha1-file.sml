(* Copyright (c) 2014 Sophia Donataccio, The MIT License (MIT) *)

val filename =
  case CommandLine.arguments () of
    filename :: [] => filename
  | _ =>
    ( print ( "Usage: "
            ^ CommandLine.name ()
            ^ "<filename>\n")
    ; OS.Process.exit OS.Process.failure)

val fstream = BinIO.openIn filename
val fstream' = BinIO.getInstream fstream

val hash = SHA1.sha1String BinIO.StreamIO.inputN fstream'

val _ = print (hash ^ "  " ^ filename ^ "\n")

val _ = BinIO.closeIn fstream
