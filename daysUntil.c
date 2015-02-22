//LS's solution to the challenge #201 E
//http://www.reddit.com/r/dailyprogrammer/comments/2vc5xq/20150209_challenge_201_easy_counting_the_days/
//
//Outputs the number of days until an inputted date, from today's date


#include <stdio.h>
#include <time.h> //I was tempted to do everything without this, just for fun, but coursework deadlines...

int main ( int argc , char **argv ) {
    if ! enoughArguments(argc) {
        printf("Not enough arguments, YYYY MM DD required.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    if ! validateDate(argv) {
        printf("Arguments must be of the form YYYY MM DD.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    
    printf("%s\n",calculateTimeDifference(argv));

    exit(EXIT_SUCCESS);
}



