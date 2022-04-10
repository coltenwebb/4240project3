module Production where

import qualified Data.Map as M

data Production = Production Symbol [[Symbol]] deriving (Eq, Show)
data Symbol = T String | Nt String | Epsilon deriving (Ord, Eq, Show)
type Grammar = [Production]

data SingleProduction = SingleProduction Symbol [Symbol]

consolidateProds :: [SingleProduction] -> [Production]
consolidateProds prods = map (uncurry Production) $ M.toList table
  where
    table :: M.Map Symbol [[Symbol]]
    table = M.fromListWith (++)
      [ (src, [symbs]) | (SingleProduction src symbs) <- prods ]

infixl 1 =:
(=:) :: Symbol -> [[Symbol]] -> Production
nt =: sx = Production nt sx

infixr 5 |.
(|.) :: a -> [a] -> [a]
(|.) = (:)

infixr 5 ##
(##) :: a -> [a] -> [a]
(##) = (:)
end_production = []

infixl 6 #
(#) :: [a] -> a -> [a]
(#) xs x = xs ++ [x]

rule :: a -> [a]
rule x = [x]