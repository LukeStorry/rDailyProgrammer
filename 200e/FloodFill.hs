import Data.List

main = interact $ findString . lines

findString::[String]->String
findString strLines
    = let 
        [w,h]  = map read $ words $ head strLines ::Int
        [x,y] = map read $ words $ last strLines ::Int
        c      = read $ last $ last strLines      ::Char
      in "" 
