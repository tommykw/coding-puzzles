readPyramid :: String -> [[Int]]
readPyramid src = map (map read . words) $ lines src

getMaxPath :: [[Int]] -> [Int]
getMaxPath [] = []
getMaxPath (x:xs) =
  foldl1 max x : getMaxPath xs

getMaxPath' :: [[Int]] -> [Int]
getMaxPath' = foldr1 step

step :: [Int] -> [Int] -> [Int]
step [] [z] = [z]
step (x:xs) (y:z:zs) = x + max y z : step xs (z:zs)

main = do
  src <- readFile "euler18.txt"
  putStrLn . show $ head $ getMaxPath' $ readPyramid src
