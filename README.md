# rexxys-linked-matrix
Rexxy's Linked Matrix - Synchronized HUB75 matrix visualizer with Ableton Link support

## Tested On Hardware/Software (will probably work on similar setups)
- Raspberry Pi 4 Model B Rev 1.5 4GB running Debian GNU/Linux 12 (bookworm)
- Two Waveshare HUB75 2.5mm pitch 64x32 displays

## Building
- First, clone this repo

```
cd ~
mkdir Repos
cd Repos
git clone https://github.com/pandamusrex/rexxys-linked-matrix.git
```

- Next, in a folder at the same level as the root of this repo, clone the Ableton Link repo

```
cd ~/Repos
git clone https://github.com/Ableton/link.git
```

- Install CMake

```
sudo apt update
sudo apt install -y cmake
```

- Install PortAudio

```
sudo apt-get install -y portaudio19-dev
```

- Build the Ableton link repo following their instructions, e.g.:

```
cd ~/Repos/link
git submodule update --init --recursive
mkdir build
cd build
cmake ..
cmake --build .
```

- I get a lot of these warnings when building link which I ignored:

```
...note: parameter passing for argument of type ‘std::pair<..., ...>’ when C++17 is enabled changed to match C++14 in GCC 10.1
```

- Start Ableton Live
- Start Link in Ableton Live by clicking on Link in the top left of the UI

- Test your build of Link by running LinkHut and pressing 'a' to join the Jam, i.e.:
```
cd ~/Repos/link/build/bin
./LinkHut
```

- It should look like this:
```
 < L I N K  H U T >

usage:
  enable / disable Link: a
  start / stop: space
  decrease / increase tempo: w / e
  decrease / increase quantum: r / t
  enable / disable start stop sync: s
  quit: q

enabled | num peers | quantum | start stop sync | tempo   | beats   | metro
yes     | 1         | 4       | no  [stopped]   | 120.00  | 74.25   | XXXO
```
