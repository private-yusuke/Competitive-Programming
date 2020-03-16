f x = sum [read [c] | c <- show x]

main = do
    [n,a,b] <- map read . words <$> getLine
    print $ sum [k | k <- [1..n], f k >= a, f k <= b]