

main = interact $ findString . lines

findString::[String]->String
findString (firstline:rest)
    = let (w,h) = parseInts firstline

      in "" 

parseInts::String->[Int]
parseInts "" = []
parseInts s = map (read . words) s
