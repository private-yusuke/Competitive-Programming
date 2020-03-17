open Batteries

let n = read_int()

let rec check (t1,x1,y1) (t2,x2,y2) =
    let dx, dy, dt = abs(x2-x1), abs(y2-y1), t2-t1 in
    (dt >= dx + dy) && ((dt-dx-dy) mod 2 = 0)

let rec ok = function
    | p1::p2::ps -> check p1 p2 && ok (p2::ps)
    | _ -> true

let ts = List.init n (fun _ -> Scanf.sscanf (read_line ()) "%d %d %d" (fun t x y -> t, x, y))
let () = (if ok ((0,0,0)::ts) then "Yes" else "No") |> print_endline