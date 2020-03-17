open Batteries
open Enum.Infix

let n, y = Scanf.scanf "%d %d" (fun n y -> (n, y))
let _ =
    for i = 0 to n do
        for j = 0 to n-i do
            let k = n - i - j in
            if i*10000 + j*5000 + k*1000 = y then (
                Printf.printf "%d %d %d\n" i j k;
                exit 0
            )
        done
    done;
    print_endline "-1 -1 -1"