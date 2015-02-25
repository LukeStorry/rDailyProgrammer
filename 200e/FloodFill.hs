
import Data.List (lines, unlines)

main::IO()
main = interact $ unlines . main' . lines


main'::[String]->[String]        
main' input 
    = let 
        [w,h]   = map read $ words $ head input         ::[Int]
        [x,y,_] = map read $ words $ last input         ::[Int]
        image   = intercalate "" $ tail $ init input    ::[Char]
        c       = last $ last input                     ::Char
        d       = (image !! y) !! x                     ::Char
    in fill (w,h) (x,y,c,d) image

--maybe add validation checks here later...

fill::(Int,Int)->(Int,Int,Char,Char)->[Char]->[Char]
fill (w,h) (x,y,c,d) image
    --fill if still in pool
    | (image !! y) !! x == d    = replaceChar x y c image
    | (image !! y) !! x /= d    = image
    --check for edges, move on
    | x == w-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) image
    | x == 0    = fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) image
    | y == h-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) image
    | y == 0    = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y+1,c,d) image

    |otherwise  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) image


replaceChar::Int->Int->Char->[String]->[String]
replaceChar 0 0 c ((_:right):down) = ((c:right):down)
replaceChar x 0 c ((left:right):down) = (left: --the problem is this re-connection. might have to combine [string] into string
                                            (replaceChar x-1  0 c (right)):down
replaceChar x y c (up:down) = up:(replaceChar x  y-1 c down)

