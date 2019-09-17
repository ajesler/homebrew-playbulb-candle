# homebrew-playbulb-candle

Installs the [candle-cli](https://github.com/ajesler/playbulb-candle) binary for controlling MiPOW Playbulb candles via the comamnd line.


### Releasing a new version

Assuming you are running on macOS,

1. Tag a new release of https://github.com/ajesler/playbulb-candle with a version, eg v0.2.0
1. Go to the [releases page](https://github.com/ajesler/playbulb-candle/releases) and download the .tar.gz file
1. run `shasum -a 256 playbulb-candle-0.2.0.tar.gz`
1. Update `playbulb-candle.rb` with a link to the new tar.gz file and update the sha256 value
1. Run `brew install --build-from-source ./playbulb-candle.rb` to check it installs
