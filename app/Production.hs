module Production where

newtype Production = Production Symbol [[Symbol]]
newtype Symbol = T String | Nt String
type Grammar = [Production]

(:=) :: String -> [[Symbol]] -> Production
s1 := sx = Production (Nt s1) sx