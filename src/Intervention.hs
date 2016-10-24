{-# LANGUAGE DeriveGeneric #-}

module Intervention (Intervention, allInterventions, getIntervention) where

import GHC.Generics


data Intervention = Intervention {
    interventionId :: Int,
    title :: String
} deriving(Show, Generic)

i1 :: Intervention
i1 = Intervention {interventionId = 1, title = "intervention 1"}

i2 :: Intervention
i2 = Intervention {interventionId = 2, title = "intervention 2"}

i3 :: Intervention
i3 = Intervention {interventionId = 3, title = "intervention 3"}


allInterventions :: [Intervention]
allInterventions = [i1, i2, i3]

getIntervention :: Int -> [Intervention]
getIntervention i = filter (\x -> interventionId x == i) allInterventions