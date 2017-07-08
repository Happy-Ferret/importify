{-# LANGUAGE QuasiQuotes #-}

-- | This module contains common utilities for working with importify cache.

module Importify.Paths
       ( -- * Predefined directories
         cacheDir
       , cachePath
       , extensionsFile
       , extensionsPath
       , modulesFile
       , modulesPath
       , symbolsDir
       , symbolsPath
       , targetsFile
       , targetsPath
       , testDataPath
       , testDataDir

         -- * Utility functions to work with directories
       , guessCabalName
       ) where

import           Universum

import           Path            (Dir, File, Rel, fromRelDir, fromRelFile, reldir,
                                  relfile)
import           Path.Internal   (Path (..))
import           System.FilePath ((<.>))

cachePath :: Path Rel Dir
cachePath = [reldir|.importify/|]

-- | Path to file that stores mapping from module names to their packages.
modulesPath :: Path Rel File
modulesPath = [relfile|modules|]

symbolsPath :: Path Rel Dir
symbolsPath = [reldir|symbols/|]

-- | Path to JSON-encoded Map from project module name to
-- its target (i.e. __library__, __executable__).
targetsPath :: Path Rel File
targetsPath = [relfile|targets|]

-- | Path to golden tests.
testDataPath :: Path Rel Dir
testDataPath = [reldir|test/test-data/|]

-- | Path to JSON-encoded Map from target to its list of default extensions.
extensionsPath :: Path Rel File
extensionsPath = [relfile|extensions|]

cacheDir, extensionsFile, modulesFile, symbolsDir, targetsFile, testDataDir :: FilePath
cacheDir    = fromRelDir  cachePath
extensionsFile = fromRelFile extensionsPath
modulesFile = fromRelFile modulesPath
symbolsDir  = fromRelDir  symbolsPath
targetsFile = fromRelFile targetsPath
testDataDir = fromRelDir  testDataPath

-- TODO: probably not reliable, instead file with
-- .cabal extension should be searched
guessCabalName :: FilePath -> Path Rel File
guessCabalName libName = Path $ libName <.> ".cabal"
