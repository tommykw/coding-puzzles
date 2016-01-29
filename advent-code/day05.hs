{-# LANGUAGE ExplicitForAll #-}

module Main where

import Control.Applicative (liftA2)
import Data.List (foll', group)
import qualified Data.Set as S
import System.Environment (getArgs)

-- | A lifted ('&&').
(<&&>) :: Applicative f => f Bool -> f Bool -> f Bool
(<&&>) = liftA2 (&&)
{-E INLINE (<&&>) #-}

-- not implements
