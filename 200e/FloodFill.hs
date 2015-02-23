import Data.List

main
    --input <- lines.getContents
    = let 
        input = lines.getContents
        [w,h]   = map read $ words $ head input  ::[Int]
        [x,y,_] = map read $ words $ last input  ::[Int]
        c       = last $ last input              :: Char
        array   = tail . init input              ::[[Char]]
    in interact $ unlines . (fill (w,h) (x,y,c) array) . lines

fill:: (Int,Int)->(Int,Int,Int)->[[Char]]->[[Char]]
fill (w,h) (x,y,c) array
    = [['0']]

