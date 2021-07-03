{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_lispy (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/bin"
libdir     = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/lib/x86_64-linux-ghc-8.10.4/lispy-0.1.0.0-JCYSbtIImDtKOmDe78XXI1"
dynlibdir  = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/lib/x86_64-linux-ghc-8.10.4"
datadir    = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/share/x86_64-linux-ghc-8.10.4/lispy-0.1.0.0"
libexecdir = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/libexec/x86_64-linux-ghc-8.10.4/lispy-0.1.0.0"
sysconfdir = "/home/jose/Documents/Code/haskell/lispy/.stack-work/install/x86_64-linux-nix/ce76bc2a96944c3c6328ee5629d3def49fd0437784dc152693844ec58fd01e43/8.10.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lispy_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lispy_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lispy_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lispy_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lispy_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lispy_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
