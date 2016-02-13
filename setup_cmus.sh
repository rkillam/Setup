sudo apt-get install \
    git \
    libncursesw5-dev \
    libavformat-dev \
    libalsa-ocaml-dev \
    libpulse-dev \
    libjack-dev \
    libsamplerate-ocaml-dev \
    libopusfile-dev \
    libao-ocaml-dev \
    libvorbis-ocaml-dev


git clone https://github.com/cmus/cmus.git
cd cmus
./configure CONFIG_FFMPEG=y
make
sudo make install

mkdir ~/.cmus

echo "set passwd=password" >> ~/.cmus/rc
echo "add ~/Media/Music" >> ~/.cmus/rc
