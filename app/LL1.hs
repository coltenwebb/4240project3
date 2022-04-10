module LL1 where

import qualified Data.Map as M 

type ReductionRule = Production -> [Production]
type symbol

removeIndirectLeftRecursion :: Grammar -> Grammar 

removeDirectLeftRecursion :: ReductionRule 

applyLeftFactorization :: ReductionRule
applyLeftFactorization (Production _ target) = foldl' f M.empty target 
  where 
    f :: [Symbol] -> Map Symbol [[Symbol]] -> Map 
    f symbols map = 