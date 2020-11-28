{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators    #-}

module Backend ( backend ) where

import Common
import Data.Proxy  ( Proxy )
import Network.Wai ( Application )
import Servant     ( Server, Proxy (..), (:<|>) (..)
                   , serve, serveDirectoryFileServer
                   )

backend :: Application
backend = serve (Proxy @API) server

server :: Server API
server = pingpong :<|> static
  where
    pingpong Ping = pure Pong
    pingpong Pong = pure Ping
    static = serveDirectoryFileServer
               "../dist-ghcjs/build/x86_64-linux/ghcjs-8.6.0.1/\
               \frontend-0.1.0.0/x/frontend/build/frontend/frontend.jsexe"
