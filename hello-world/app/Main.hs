module Main where

import Lib
import System.IO (readFile)

main :: IO ()
main = do
  putStrLn("bobby")
  putStrLn("world")

printNumbers = do
  putStrLn(show(3+4))

printConfig = do
  contents <- readFile "stack.yaml"
  putStrLn contents
