{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Common ( API ) where

import Servant.API ( Get, JSON, ReqBody, Raw, (:>), (:<|>) )

type API = "api" :> ReqBody '[JSON] Integer :> Get '[JSON] Integer
  :<|> Raw
