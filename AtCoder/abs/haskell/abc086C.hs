import Control.Monad
check [t1,x1,y1] [t2,x2,y2] =
    (dt >= dx + dy) && ((dt-dx-dy) `mod` 2 == 0)
    where dx = abs(x2-x1)
          dy = abs(y2-y1)
          dt = t2-t1

ok [a,b] = check a b
ok (a:b:xs) = check a b && ok (b:xs)

main = do
    n <- readLn
    txys <- replicateM n $ map read . words <$> getLine
    putStrLn $ if ok ([0,0,0]:txys) then "Yes" else "No"