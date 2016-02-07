{-# LANGUAGE ExplicitForAll #-}

module Main where

import qualified Data.Set as S
import Data.List (foldl')

type Coord = (Int, Int)

start :: Coord
start = (0, 0)

solve :: String -> S.Set Coord
