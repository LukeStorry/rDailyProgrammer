import Data.List

main = interact $ parser . lines

--takes lines from main, parses into args, passes to findString, then outputs result
parser::[String]->String
parser input
    = let 
        [w,h]   = map read $ words $ head input  ::[Int]
        [x,y,_] = map read $ words $ last input  ::[Int]
        c       = last $ last input              :: Char
        array   = tail . init input              ::[Char}
      in findString w h x y c array


findString 
