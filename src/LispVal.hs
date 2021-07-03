{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LispVal where
-- defines LispVal, evaluation monad, LispException, and report printing functions.

import Data.Typeable (Typeable)
import qualified Data.Text as T
import qualified Data.Map as Map

import Control.Exception
import Control.Monad.Reader