#include "unistd.h"
#include <atomic>
#include "signal.h"

#include "ableton/Link.hpp"

std::atomic_bool signalled = false;

static void InterruptHandler(int signo) {
	signalled = true;
}

int main(int argc, char **argv) {

	signal(SIGTERM, InterruptHandler);
	signal(SIGINT, InterruptHandler);
	signal(SIGHUP, InterruptHandler);

	ableton::Link link(120.);
	link.enable(true);

	int numPeers = 0;
	float sessionTempo = 120.;

	do {
		numPeers = link.numPeers();
		sessionTempo = link.captureAppSessionState().tempo();
		std::cout << "Num Peers: " << numPeers << " ... Tempo: " << sessionTempo << "    " <<  "\r";
		if (signalled) {
			break;
		}
		usleep(10000);
	} while (true);

	link.enable(false);

	return 0;
}

