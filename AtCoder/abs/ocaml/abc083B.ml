open Batteries

let n, a, b = Scanf.sscanf (read_line ()) "%d %d %d" (fun n a b -> (n, a, b))

let digitsum x =
    string_of_int x
    |> String.explode
    |> List.map (fun x -> int_of_char x - (int_of_char '0'))
    |> List.fold_left (+) 0

let ans =
    Enum.range 1 ~until:n
    |> Enum.filter (fun x -> let y = digitsum x in a <= y && y <= b)
    |> Enum.reduce (+)
    |> string_of_int
let () = print_endline ans