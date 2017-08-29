module Lib where

import System.Directory
import Data.List


listeningDir :: String -> IO FilePath
listeningDir dirName = do
    homeDir <- getHomeDirectory
    return $ homeDir ++ "/" ++ dirName

listDir :: FilePath -> IO [FilePath]
listDir path = sort <$> listDirectory path

