open Batteries

let _ = read_int ()

let rec f n = function
    | [] -> n
    | [x] -> n + x
    | x::y::zs -> f (n+x-y) zs;;

read_line ()
    |> String.split_on_char ' '
    |> List.map int_of_string
    |> List.sort (flip compare)
    |> f 0
    |> string_of_int
    |> print_endline