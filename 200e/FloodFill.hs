
import Data.List (lines, unlines)

main::IO()
main = interact $ unlines . parser . lines 


parser::[String]->[String]        
parser input 
    = let 
        [w,h]   = map read $ words $ head input ::[Int]
        [x,y,_] = map read $ words $ last input ::[Int]
        image   = tail $ init input             ::[[Char]]
        newChar       = last $ last input             ::Char
        floodPlane       = (image !! y) !! x             ::Char
    in fill (w-1,h-1) (x,y,newChar,floodPlane) image

--maybe add validation checks here later...

fill::(Int,Int)->(Int,Int,Char,Char)->[[Char]]->[[Char]]
fill (w,h) (x,y,newChar,floodPlane) image
    | thisChar == newChar    = image
    --check for edges, then move on
    | x == w-1  = up $ down $ left         newImage
    | x == 0    = up $ down $        right newImage
    | y == h-1  = up $        left $ right newImage 
    | y == 0    =      down $ left $ right newImage
    |otherwise  = up $ down $ left $ right newImage

    where up    = fill (w,h) (x,y-1,newChar,floodPlane) 
          down  = fill (w,h) (x,y+1,newChar,floodPlane)
          left  = fill (w,h) (x-1,y,newChar,floodPlane)
          right = fill (w,h) (x+1,y,newChar,floodPlane)
          thisChar =  (image !! y) !! x 
          newImage = if thisChar == floodPlane
                        then (replaceChar x y newChar image)
                        else image
         
replaceChar::Int->Int->Char->[String]->[String]
replaceChar 0 0 c ((_:right):down) = ((c:right):down)
replaceChar x 0 c ((left:right):down) = let (newRight:newDown) = (replaceChar (x-1) 0 c (right:down))
                                        in ((left:newRight):newDown)
replaceChar x y c (up:down) = up:(replaceChar x  (y-1) c down)

