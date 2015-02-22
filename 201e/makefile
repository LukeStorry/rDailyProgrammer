all: daysUntil.c
	gcc -std=c99 -pedantic -Wall -O3  -o daysUntil daysUntil.c

debug:
	gcc -std=c99 -g -o test daysUntil.c && gdb ./test
	
clean: 
	$(RM) daysUntil test


