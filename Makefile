
CC=gcc
RM=rm -f
#debug
#CFLAGS=-g -Wall
#LDFLAGS=-lm

# fave ..
#CFLAGS=-Wextra -Wall -O2 -funroll-loops -march=native -flto -pipe -minline-all-stringops 
#LDFLAGS=-flto -lm



#CFLAGS=-Wextra -Wall -Ofast -fomit-frame-pointer -march=native -flto -funroll-loops -pipe
#CFLAGS=-Wall -g -O2 -march=native -flto  -pipe
#LDFLAGS=-flto 

#CFLAGS=-Wall -O2
#LDFLAGS=

#CFLAGS=-g -pg -O3 -DL2PUSETHREADS=1 -Wall 
#LDFLAGS=-pg

CFLAGS=-g -fstack-protector -D_FORTIFY_SOURCE=2 -Wall
LDFLAGS=-lm


#CFLAGS=-Ofast -fprofile-generate -fomit-frame-pointer -march=native -flto -funroll-loops
#LDFLAGS=-flto -fprofile-generate

#CFLAGS=-Ofast -fprofile-use -fomit-frame-pointer -march=native -flto -funroll-loops
#LDFLAGS=-flto -fprofile-use

LDLIBS=-lm -lpthread

SRCS=l2p.c pwgenes.c l2pstats.c utilfuncs.c 
#SRCS=l2p.c pwgenes.c utilfuncs.c 
OBJS=$(subst .c,.o,$(SRCS))

all: l2p

#
l2p: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) -o l2p $(OBJS) $(LDLIBS)

l2p.o: small.h pathworks.h l2p.c utilfuncs.c 

pwgenes.o: small.h pathworks.h pwgenes.c

clean:
	$(RM) $(OBJS)

distclean: clean
	$(RM) l2psmall


