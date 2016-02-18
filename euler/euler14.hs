import Data.List
import Control.Parallel

nextcollatz :: (Integral a) => a -> a
nextcollatz n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

collatz :: (Integral a) => a -> [a]
collatz = iterate nextcollatz

euler14 =
  let
    list = collatztupel (10^6)
    sortGT (a1, b1) (a2, b2)
      | a1 < a2 = GT
      | a1 > a2 = LT
      | otherwise = EQ

  in
    head $ sortBy sortGT list

main = do
  putStrLn . show $ euler14
