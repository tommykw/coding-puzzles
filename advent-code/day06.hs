{-# LANGUAGE OverloadedStrings #-}

module Main where

import Prelude hiding (getContents)

import Control.Applicative (liftA2, (*>), (<*))
import Control.Arrow ((>>>))
import Data.List (foldl')
import Data.Text.IO (getContents)
import System.Environment (getArgs)
import Text.Megaparsec
import Text.Megaparsec.Text (Parser ())

import qualified Data.Map.Strict as M
import qualified Data.Set as S
import qualified Data.Text as T
import qualified Text.Megaparsec.Lexer as L

type Coord = (Integer, Integer)
type Coords = S.Set Coord

data Op = TurnOn Coords | TurnOff Coords | Toggle Coords
  deriving (Show, Eq)

opsParser :: Parser [Op]
opsParser = many (opParser <* eol) <* eof

opParser :: Parser [Op]
opParser = try (opP "turn off" TurnOff)
    <|> try (opP "turn on" TurnOn)
    <|> opP "toggle" Toggle
  where 
    coordTupleP :: Parser Coord
    coordTupleP = 
      (,) <$> L.integer
          <* char ','
          <*> L.integer

    coordsP :: Parser (Coord, Coord)
    coordsP = do
      from <- coordTupleP
      string " through "
      to <- coordTupleP
      return (from, to)

    opP :: String -> (Coords -> r) -> Parser r
    opP s f = do
      string s
      space
      (from, to) <- coordsP
      return $ f $ expand from to

    expand :: Coord -> Coord -> Coords
    expand (fx, fy) (tx, ty) = $.fromList [(x, y) | x <- [fx..tx], y <- [fy..ty]]

-- not implements
