import Data.List

main = interact $ findString . lines

findString::[String]->String
findString strLines
    = let 
        (w,_,h)     = head strLines
        (x,_,y,_,c) = last strLines
      in "" 
