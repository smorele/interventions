{-# LANGUAGE OverloadedStrings #-}

module Main where

import Database.MongoDB (connect, host)
import Web.Scotty hiding (json)
import Data.Aeson
import qualified Data.Text.Lazy as T
import Intervention


main :: IO ()
main = do    
    putStrLn "Starting server ..."
    pipe <- connect $ host "127.0.0.1"
    scotty 3000 $ do -- start scotty on port 3000
        get "/" $ do
            redirect "/help/"

        get "/db" $ do
            res <- getDatabases pipe
            text $ T.pack $ show res

        get "/interventions" $ do
            res <- getInterventions pipe
            text $ T.pack $ show res


        get "/help" $ do
            html "<ul><li><a href=\"/interventions\">/interventions</a>: list interventions</li></ul>"