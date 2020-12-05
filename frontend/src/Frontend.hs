{-# LANGUAGE FlexibleContexts    #-}
{-# LANGUAGE GADTs               #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE RecursiveDo         #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications    #-}

module Frontend (frontend) where

import Common
import Control.Monad.Fix ( MonadFix )
import Data.Proxy        ( Proxy (..) )
import Reflex.Dom
import Servant.API
import Servant.Reflex

frontend :: forall m t
          . ( SupportsServantReflex t m
            , DomBuilder t m
            , DomBuilderSpace m ~ GhcjsDomSpace
            , MonadFix m
            , PostBuild t m
            , MonadHold t m
            )
         => m ()
frontend = divClass "layout" $ mdo
  let (pingpong :<|> _) = client (Proxy @API)
                                 (Proxy @m)
                                 (Proxy @())
                                 (constDyn $ BasePath "/")
      mkClass x    = "class" =: ("button " <> toClass x) <> "type" =: "button"
      toClass Ping = "ping"
      toClass Pong = "pong"
      toText  Ping = "PING"
      toText  Pong = "PONG"
  dPingPong <- holdDyn Ping result
  trigger <- do
    (e, _) <- elDynAttr' "button" (mkClass <$> dPingPong)
      $ dynText $ toText <$> dPingPong
    pure $ domEvent Click e
  result  <- fmapMaybe reqSuccess <$> pingpong (Right <$> dPingPong) trigger
  pure ()
