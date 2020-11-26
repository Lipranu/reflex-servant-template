{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeOperators    #-}

module Backend ( backend ) where

import Common
import Data.Proxy  ( Proxy )
import Network.Wai ( Application )
import Servant     ( Server, Raw, Proxy (..), (:<|>) (..)
                   , serve, serveDirectoryFileServer
                   )

type Backend = API :<|> Raw

backend :: Application
backend = serve (Proxy @Backend) server

server :: Server Backend
server = update :<|> static
  where
    update = pure . (+1)
    static = serveDirectoryFileServer
               "../dist-ghcjs/build/x86_64-linux/ghcjs-8.6.0.1/\
               \frontend-0.1.0.0/x/frontend/build/frontend/frontend.jsexe"
