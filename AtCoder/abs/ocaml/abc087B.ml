let a = read_int ()
let b = read_int ()
let c = read_int ()
let x = read_int ()
let ans = ref 0;;

for i = 0 to a do
    for j = 0 to b do
        for k = 0 to c do
            if 500*i + 100*j + 50*k = x then incr ans
        done
    done
done
let () = print_endline @@ string_of_int !ans