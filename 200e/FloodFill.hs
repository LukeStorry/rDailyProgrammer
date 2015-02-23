
import Data.List (lines, unlines)

main::IO()
main = interact $ unlines . main' . lines


main'::[String]->[String]        
main' input 
    = let 
        [w,h]   = map read $ words $ head input ::[Int]
        [x,y,_] = map read $ words $ last input ::[Int]
        array   = tail $ init input             ::[[Char]]
        c       = last $ last input             ::Char
        d       = (array !! y) !! x             ::Char
    in fill (w,h) (x,y,c,d) array

--maybe add validation checks here later...

fill::(Int,Int)->(Int,Int,Char,Char)->[[Char]]->[[Char]]
fill (w,h) (x,y,c,d) array
    --fill if still in pool
    | (array !! y) !! x == d    = replaceChar x y c array
    | (array !! y) !! x /= d    = array
    --check for edges, move on
    | x == w-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) array
    | x == 0    = fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) array
    | y == h-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) array
    | y == 0    = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y+1,c,d) array

    |otherwise  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) array

replaceChar::Int->Int->Char->[[Char]]->[[Char]]
replaceChar 0 0 c [[h:s]:xs] = [[c]++s]++xs
replaceChar a b c ar =[[" "]]

