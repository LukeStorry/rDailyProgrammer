-- LS's solution to 
-- http://www.reddit.com/r/dailyprogrammer/comments/2wbvuu/20150218_challenge_202_intermediate_easter/

--input year, output easter's date.

import Prelude --(interact,read)
import System.Locale (defaultTimeLocale) 
import Data.Time.Format (formatTime)
import Data.Time.Calendar.Easter (gregorianEaster)

main = interact $ formatTime defaultTimeLocale "In %Y, Easter will be on %A the %d of %B." . gregorianEaster . read

-- read accepts the integer from interact, passess it into the gregorianEaster function, which outputs a day. formatTime uses the default locale, my custom sting, and this outputted day, to format a string and output it, through interact, to the console.

