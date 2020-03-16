main = do
    a <- readLn
    b <- readLn
    c <- readLn
    x <- readLn
    print $ length [(p,q,r) | p <- [0..a], q <- [0..b], r <- [0..c], 500*p+100*q+50*r == x]