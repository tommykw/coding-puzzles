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
