main = interact main'

main'::String->String
main' input = sum $ map read $ lines input

sum::[Int]->Int
sum [a] = a
sum (a:b) = a + sum b
