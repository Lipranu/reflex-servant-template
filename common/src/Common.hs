{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE TypeOperators      #-}
{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE DeriveAnyClass     #-}

module Common
  ( API
  , PingPong (..)
  ) where

import Data.Aeson   ( FromJSON, ToJSON )
import GHC.Generics ( Generic )
import Servant.API  ( Post, JSON, Raw, ReqBody, (:>), (:<|>) )

type API = "api" :> ReqBody '[JSON] PingPong :> Post '[JSON] PingPong
  :<|> Raw

data PingPong
  = Ping
  | Pong
  deriving stock (Generic, Show, Eq)
  deriving anyclass (ToJSON, FromJSON)
