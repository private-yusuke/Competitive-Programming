import Control.Monad
f [] = 0
f (x:xs) = 1 + (f [k | k <- xs, k /= x])

main = do
    n <- readLn
    ds <- replicateM n readLn
    print $ f (ds :: [Integer])