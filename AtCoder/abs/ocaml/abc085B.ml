open Batteries

let rec f n = function
    [] -> n
    | y::ys -> f (n+1) (List.filter (fun a -> y <> a) ys);;

let n = read_int ();;

List.init n (fun _ -> read_int())
    |> f 0
    |> string_of_int
    |> print_endline