module Main where

import Lib
import System.IO (readFile)

main :: IO ()
main = do
  name <- getLine
  putStrLn("Hello, " ++ name)
  putStrLn("bobby")
  putStrLn("world")
  printNumbers
  printConfig

printNumbers = do
  putStrLn(show(3+4))

printConfig = do
  contents <- readFile "stack.yaml"
  putStrLn contents
