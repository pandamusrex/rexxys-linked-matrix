# rexxys-linked-matrix
Rexxy's Linked Matrix - Synchronized HUB75 matrix visualizer with Ableton Link support

## Tested On Hardware/Software (will probably work on similar setups)
- Raspberry Pi 4 Model B Rev 1.5 4GB running Debian GNU/Linux 12 (bookworm)
- Two Waveshare HUB75 2.5mm pitch 64x32 displays

## Wiring

Based on https://github.com/hzeller/rpi-rgb-led-matrix/blob/master/wiring.md

Note: The IDC connector notch is on the same side as the odd numbered pins.

Note: I've also included the color of the ribbon cable wire for each pin.

|-----------|---------|-----------|-----------|---------|-----------|
| Color     | Signal  | HUB75 Pin | HUB75 Pin | Signal  | Color     |
|-----------|---------|-----------|-----------|---------|-----------|
| Brown-1   | R1      | 1         | 2         | G1      | Red-1     |
| Orange-1  | B1      | 3         | 4         | GND     | Yellow-1  |
| Green-1   | R2      | 5         | 6         | G2      | Blue-1    |
| Purple    | B2      | 7         | 8         | GND     | Gray      |
| White     | A       | 9         | 10        | B       | Black     |
| Brown-2   | C       | 11        | 12        | GND     | Red-2     |
| Orange-2  | CLK     | 13        | 14        | LATCH/STROBE | Yellow-2  |
| Green-2   | OE      | 15        | 16        | GND     | Blue-2    |
|-----------|---------|-----------|-----------|---------|-----------|


|-----------|---------|--------|--------|---------|-----------|
| HUB75 Pin | Signal  | Pi Pin | Pi Pin | Signal  | HUB75 Pin |
|-----------|---------|--------|--------|---------|-----------|
|           | 3.3V    | 1      | 2      | 5V      |           |
|           | GPIO 2  | 3      | 4      | 5V      |           |
|           | GPIO 3  | 5      | 6      | GND     | ?         |
| LATCH/STROBE (14) | GPIO 4 | 7 | 8    | GPIO 14 |           |
|           | GND     | 9      | 10     | GPIO 15 | ?         |
| CLK (13)  | GPIO 17 | 11     | 12     | GPIO 18 | OE (15)   |
| G1 (2)    | GPIO 27 | 13     | 14     | GND     |           |
| A (9)     | GPIO 22 | 15     | 16     | GPIO 23 | B (10)    |
|           | 3.3V    | 17     | 18     | GPIO 24 | C (11)    |
| B2 (7)    | GPIO 10 | 19     | 20     | GND     |           |
| G2 (6)    | GPIO 9  | 21     | 22     | GND     |           |
| R1 (1)    | GPIO 11 | 23     | 24     | GPIO 25 | R2 (5)    |
| GND (4)   | GND     | 25     | 26     | GPIO 7  | B1 (3)    |
|           | GPIO 0  | 27     | 28     | GPIO 1  |           |
|           | GPIO 5  | 29     | 30     | GND     |           |
|           | GPIO 6  | 31     | 32     | GPIO 12 |           |
|           | GPIO 13 | 33     | 34     | GND     |           |
|           | GPIO 19 | 35     | 36     | GPIO 16 |           |
|           | GPIO 26 | 37     | 38     | GPIO 20 |           |
|           | GND     | 39     | 40     | GPIO 21 |           |
|-----------|---------|--------|--------|---------|-----------|

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
