//LS's solution to the challenge #201 E
//http://www.reddit.com/r/dailyprogrammer/comments/2vc5xq/20150209_challenge_201_easy_counting_the_days/
//
//Outputs the number of days until an inputted date, from today's date

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdbool.h>
#include <time.h> //I was tempted to do everything without this, just for fun, but coursework deadlines...


bool enoughArgs(int num);
bool argLengths(char **argv);
bool argInts(char **argv);

time_t parseInput(char **argv);
char *timeDiffStr(time_t from , time_t until);

int main ( int argc , char **argv ) {
    if (!enoughArgs(argc)) {
        printf("Incorrect number of arguments, YYYY MM DD required.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    if (!argLengths(argv)) {
        printf("Arguments must be of the form YYYY MM DD.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    if (!argInts(argv)) {
        printf("Arguments must be Integers.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    printf("%s\n",timeDiffStr(time(NULL), parseInput(argv)));
    exit(EXIT_SUCCESS);
}


//test for 3 parameters 
bool enoughArgs(int num) {
    if (num == 4) return true;
    else          return false;   
}

//check that the 3 arguments are xxxx xx xx
bool argLengths(char **argv) {
    bool valid = true; //innocent until proven guilty, right?
    if(strlen(argv[1]) != 4) valid = false;
    if(strlen(argv[2]) != 2) valid = false;
    if(strlen(argv[3]) != 2) valid = false;
    return valid;
}
    //check that the 3 arguments are xxxx xx xx
bool argInts(char **argv) {
    bool valid = true; //innocent until proven guilty, right?
    for ( int i = 0 ; i < 4 ; i++ )
       if (!isdigit(argv[1][i])) valid = false;
    for ( int i = 0 ; i < 2 ; i++ )
       if (!isdigit(argv[2][i])) valid = false;
    for ( int i = 0 ; i < 2 ; i++ )
       if (!isdigit(argv[3][i])) valid = false;
    return valid;
}

//convert argv into calendar and then into time.
time_t parseInput(char **argv){
    struct tm input;
    input.tm_year = atoi(argv[1])-1900;
    input.tm_mon  = atoi(argv[2])-1;
    input.tm_mday = atoi(argv[3]);
    return mktime(&input);
}

//output a string comparing two times.
char *timeDiffStr(time_t from , time_t until){
    char * buffPtr;
    sprintf(buffPtr,"There are %.1f days between %s and %s.", (from-until), ctime(&from), ctime(&until));
    return buffPtr;
}
