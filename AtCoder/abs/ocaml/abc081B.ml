open Batteries

let _ = read_int ()
let xs = read_line ()
    |> String.split_on_char ' '
    |> List.map int_of_string

let rec f n =
    let m = Int.pow 2 (n+1) in
    if List.for_all (fun x -> x mod m == 0) xs then f (n+1) else n

let ans = string_of_int @@ f 0
let () = print_endline ans