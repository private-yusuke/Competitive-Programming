let a, b = Scanf.sscanf (read_line ()) "%d %d" (fun a b -> (a, b))
let () = print_endline (if a*b mod 2 == 0 then "Even" else "Odd")