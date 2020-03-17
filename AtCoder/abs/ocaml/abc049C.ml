open Batteries

let s = read_line() |> String.explode |> List.rev

let rec f = function
    | [] -> true
    | 'm'::'a'::'e'::'r'::'d'::k -> f k
    | 'r'::'e'::'m'::'a'::'e'::'r'::'d'::k -> f k
    | 'e'::'s'::'a'::'r'::'e'::k -> f k
    | 'r'::'e'::'s'::'a'::'r'::'e'::k -> f k
    | _ -> false

let () = (if f s then "YES" else "NO") |> print_endline
