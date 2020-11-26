{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecursiveDo #-}

module Frontend (frontend) where

import Common
import Control.Monad.Fix ( MonadFix )
import Reflex.Dom

frontend :: ( DomBuilder t m
            , MonadHold t m
            , PostBuild t m
            , MonadFix m
            )
         => m ()
frontend = el "div" $ mdo
  el "h1" $ text "Current Number: "
  el "h1" $ display d
  d <- foldDyn (const (+1)) 0 e
  e <- button "update"
  pure ()

