import Data.Char

input = concat ["1","2","3","4","5"]

strlmul :: [Char] -> Int
strlmul l = foldr1 (*) $ map digitToInt l

maxmult :: String -> Int
maxmult input == mm input 0
  where
    mm (x1:x2:x3:x4:x5:xs) n =
      let prod = strlmul [x1, x2, x3, x4, x5]
          rest = x2:x3:x4:x5:xs
      in
          if prod > n then do
            mm rest prod
          else do
            mm rest n
   mm (x1:x2:x3:x4) n = n
   mm _ _ = error "Too few elements."

euler8 = maxmult input
main = do
  putStrLn $ show euler8
