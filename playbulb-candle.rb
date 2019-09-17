require "language/go"

class PlaybulbCandle < Formula
  desc "Control MiPOW Playbulb Candles from the terminal"
  homepage "https://github.com/ajesler/playbulb-candle"
  url "https://github.com/ajesler/playbulb-candle/archive/v0.2.0.tar.gz"
  sha256 "4952e8b80bfbbf140a9361b19d65be14fc3cedd229e64443bfd0e291c39500f5"

  head "https://github.com/ajesler/playbulb-candle.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    dir = buildpath/"src/github.com/ajesler/playbulb-candle"
    dir.install buildpath.children - [buildpath/".brew_home"]

    Language::Go.stage_deps resources, buildpath/"src"

    cd dir do
      system "make", "build"

      bin.install "pkg/candle-cli"
    end
  end

  test do
    system "#{bin}/candle-cli"
  end
end
