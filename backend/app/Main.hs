module Main where

import Backend
import Network.Wai.Handler.Warp ( run )

main :: IO ()
main = run 8080 backend
