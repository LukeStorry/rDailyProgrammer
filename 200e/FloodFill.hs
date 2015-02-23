import Data.List

main = interact $ findString . lines

findString::[String]->String
findString strLines
    = let 
        [w,h]   = map read $ words $ head strLines ::[Int]
        [x,y,_] = map read $ words $ last strLines ::[Int]
        c     = last $ last strLines
      in "" 
