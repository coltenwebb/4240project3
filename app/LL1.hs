module LL1 where

import qualified Data.Map as M 
import Production

type ReductionRule = Production -> [Production]

--removeIndirectLeftRecursion :: Grammar -> Grammar 
--removeIndirectLeftRecursion = _

removeDirectLeftRecursion :: ReductionRule
removeDirectLeftRecursion p@(Production src@(Nt s) xss) =
  if null (filter ((== src) . head) xss)
    then [p]
    else consolidateProds . (epsProd :) . map f $ xss
  where
    src' = Nt (s ++ "'")

    epsProd = SingleProduction src' [Epsilon]

    f :: [Symbol] -> SingleProduction
    f (first:xs) =
      if first /= src
        then SingleProduction src  (xs ++ [src'])
        else SingleProduction src' (xs ++ [src'])

--applyLeftFactorization :: ReductionRule
--applyLeftFactorization (Production _ target) = foldl' f M.empty target 
--  where 
--    f :: [Symbol] -> Map Symbol [[Symbol]] -> Map 
--    f symbols map = _
