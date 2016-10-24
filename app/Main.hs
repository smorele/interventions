{-# LANGUAGE OverloadedStrings #-}

module Main where

import Data.Monoid ((<>))
import Web.Scotty

import Data.Aeson (FromJSON, ToJSON)

import Intervention (Intervention, allInterventions, getIntervention)
instance ToJSON Intervention



main :: IO ()
main = do
    putStrLn "Starting server ..."
    scotty 3000 $ do
        get "/interventions" $ do            
            json allInterventions

        get "/interventions/:id" $ do
            id <- param "id"
            json (getIntervention id)