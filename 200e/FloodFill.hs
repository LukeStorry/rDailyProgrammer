import Data.List

main::IO()
main = interact $ unlines . main' . lines


main'::[String]->[String]        
main' input 
    = let 
        [w,h]   = map read $ words $ head input  ::[Int]
        [x,y,_] = map read $ words $ last input  ::[Int]
        c       = last $ last input              :: Char
        array   = tail $ init input              ::[[Char]]
    in fill (w,h) (x,y,c) array



fill::(Int,Int)->(Int,Int,Char)->[[Char]]->[[Char]]
fill (w,h) (x,y,c) array
    = [['0']]

