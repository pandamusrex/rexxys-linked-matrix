CXXFLAGS=-O3 -W -Wall -Wextra -Wno-unused-parameter -D_FILE_OFFSET_BITS=64

LDFLAGS+=-lrt -lm -lpthread

all: rlm

rlm: rlm.o
	g++ -o rlm rlm.o $(LDFLAGS)

rlm.o: rlm.cpp
	g++ $(CXXFLAGS) -c rlm.cpp

