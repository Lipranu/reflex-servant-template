{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Common ( API ) where

import Servant.API ( Get, JSON, Raw, (:>), (:<|>) )

type API = "api" :> Get '[JSON] Integer
  :<|> Raw
