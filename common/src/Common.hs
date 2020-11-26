{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}

module Common ( API ) where

import Servant.API ( Get, JSON, ReqBody, (:>) )

type API = "api" :> ReqBody '[JSON] Integer :> Get '[JSON] Integer
