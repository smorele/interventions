{-# LANGUAGE OverloadedStrings #-}

module Intervention where
import Database.MongoDB
  

getDatabases p =
    access p master "local" allDatabases


getInterventions p = 
    access p master "local" $ findOne $ select [] "interventions"    