{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell   #-}

module Main where

import Frontend
import Data.FileEmbed ( embedFile )
import Reflex.Dom     ( mainWidgetWithCss )

main :: IO ()
main = mainWidgetWithCss css frontend
  where css = $(embedFile "../static/style.css")
