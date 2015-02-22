//LS's solution to the challenge #201 E
//http://www.reddit.com/r/dailyprogrammer/comments/2vc5xq/20150209_challenge_201_easy_counting_the_days/
//
//Outputs the number of days until an inputted date, from today's date


#include <stdio.h>
#include <time.h> //I was tempted to do everything without this, just for fun, but coursework deadlines...

bool enoughArguments(int num);
bool valiDate(char **argv);

char *calcTimeDiff(char **argv);

int main ( int argc , char **argv ) {
    if ! enoughArguments(argc) {
        printf("Not enough arguments, YYYY MM DD required.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    if ! valiDate(argv) {
        printf("Arguments must be of the form YYYY MM DD.\n Program will now terminate.\n");
        exit(EXIT_FAILURE);
    };
    
    printf("%s\n",calcTimeDiff(argv));

    exit(EXIT_SUCCESS);
}



bool enoughArguments(int num) {
    if (num === 3) return true;
    else           return false;   
}

bool valiDate(char **argv) {
    valid = true; //innocent until proven guilty, right?
    if(strlen(argv[1]) != 4) valid = false;
    for ( int i = 0 ; i < 4 ; i++ )
       if (! isdigit(argv[1][i]) valid = false;

    if(strlen(argv[2]) != 2) valid = false;
    for ( int i = 0 ; i < 2 ; i++ )
       if (! isdigit(argv[2][i]) valid = false;
    
    if(strlen(argv[3]) != 2) valid = false;
    for ( int i = 0 ; i < 2 ; i++ )
       if (! isdigit(argv[3][i]) valid = false;
    return valid;
}

char *calcTimeDiff(char **argv) {

    return "";
}
