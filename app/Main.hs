module Main where

import Lib
import Control.Concurrent (forkIO, threadDelay)
import Data.IORef
import Control.Monad (forever)

dirName :: String
dirName = "Sync"

delay :: Int
delay = 5000000

main :: IO ()
main = do
    var <- newIORef []
    forkIO (forever $ process var)
    forever $ readInput var

process :: IORef [FilePath] -> IO ()
process var = do
    dir <- listeningDir dirName
    files <- listDir dir
    writeIORef var files
    threadDelay delay

readInput :: IORef [FilePath] -> IO ()
readInput var = do
    files <- readIORef var
    print files
    threadDelay delay