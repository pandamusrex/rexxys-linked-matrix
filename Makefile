# ABLETON LINK
LINK_LIB_DISTRIBUTION=../link
LINK_INCDIR=$(LINK_LIB_DISTRIBUTION)/include
LINK_LIBDIR=$(LINK_LIB_DISTRIBUTION)/build
LINK_LIBRARY_NAME=abl_link
LINK_LIBRARY=$(LINK_LIBDIR)/lib$(LINK_LIBRARY_NAME).a

# ASIO
ASIO_INCDIR=asio/include

# CXXFLAGS
# LINK_PLATFORM_LINUX    Tell Ableton Link we're building on Linux
CXXFLAGS=-O3 -W -Wall -Wextra -Wno-unused-parameter -D_FILE_OFFSET_BITS=64 -DLINK_PLATFORM_LINUX=1

LDFLAGS+=-L$(LINK_LIBDIR) -l$(LINK_LIBRARY_NAME) -lrt -lm -lpthread

all: rlm

rlm: rlm.o $(LINK_LIBRARY)
	g++ -o rlm rlm.o $(LDFLAGS)

rlm.o: rlm.cpp
	g++ $(CXXFLAGS) -I$(LINK_INCDIR) -I$(ASIO_INCDIR) -c rlm.cpp

