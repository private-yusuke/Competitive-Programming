open Batteries

let ans =
    read_line ()
    |> String.explode
    |> List.map (fun c -> int_of_char c - (int_of_char '0'))
    |> List.fold_left (+) 0
    |> string_of_int

let () = print_endline ans