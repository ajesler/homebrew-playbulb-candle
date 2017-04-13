require "language/go"

class PlaybulbCandle < Formula
  desc "Control MiPOW Playbulb Candles from the terminal"
  homepage "https://github.com/ajesler/playbulb-candle"
  url "https://github.com/ajesler/playbulb-candle/archive/v0.1.1.tar.gz"
  sha256 "db82d6b5ccfc4bc779efb7f47c748898380a620113122cbc13c08c79ab5627ba"

  head "https://github.com/ajesler/playbulb-candle.git"

  depends_on "go" => :build

  go_resource "github.com/currantlabs/gatt" do
    url "https://github.com/currantlabs/gatt.git",
    :revision => "f949eac78f4ebdd9793c441ea7a7ff330eb323b0"
  end

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
