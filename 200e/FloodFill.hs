
import Data.List (lines, unlines)

main::IO()
main = do
    inputString <- getContents
    putStr $ unlines . main' $ lines inputString


main'::[String]->[String]        
main' input 
    = let 
        [w,h]   = map read $ words $ head input ::[Int]
        [x,y,_] = map read $ words $ last input ::[Int]
        image   = tail $ init input             ::[[Char]]
        c       = last $ last input             ::Char
        d       = (image !! y) !! x             ::Char
    in fill (w,h) (x,y,c,d) image

--maybe add validation checks here later...

fill::(Int,Int)->(Int,Int,Char,Char)->[[Char]]->[[Char]]
fill (w,h) (x,y,c,d) image
    --check for edges, move on
    | x == w-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) new
    | x == 0    = fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) new
    | y == h-1  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) new
    | y == 0    = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y+1,c,d) new

    |otherwise  = fill (w,h) (x-1,y,c,d) $ fill (w,h) (x+1,y,c,d) $ fill (w,h) (x,y-1,c,d) $ fill (w,h) (x,y+1,c,d) new

    where new = if (image !! y) !! x == d
                    then (replaceChar x y c image)
                    else image

replaceChar::Int->Int->Char->[String]->[String]
replaceChar 0 0 c ((_:right):down) = ((c:right):down)
replaceChar x 0 c ((left:right):down) = let (newRight:newDown) = (replaceChar (x-1) 0 c (right:down))
                                        in ((left:newRight):newDown)
replaceChar x y c (up:down) = up:(replaceChar x  (y-1) c down)

