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
frontend = el "div" $ mdo
  let (get :<|> _) = client (Proxy @API)
                            (Proxy @m)
                            (Proxy @())
                            (constDyn host)
      host = BaseFullUrl Http "localhost" 8080 ""
  el "h1" $ text "Get Number: "
  el "h1" $ do
    result <- fmapMaybe reqSuccess <$> get trigger
    number <- holdDyn 0 result
    display number
  trigger <- button "Get Number"
  pure ()

