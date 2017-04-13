class PlaybulbCandle < Formula
  desc ""
  homepage "https://github.com/ajesler/playbulb-candle"
  url "https://github.com/ajesler/playbulb-candle/archive/v0.1.0.tar.gz"
  sha256 "64b09ed0a39d1c6a76a08daba33b8a1a2ff1470fcb40ec8ee9e4d2be4e451a6d"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    mkdir_p buildpath/"src/github.com/ajesler"
    ln_s buildpath, buildpath/"src/github.com/ajesler/playbulb-candle"
    system "go", "build", "-ldflags", "-X main.compiled_version=#{version} -X main.compiled_root_data_directory=#{var/'playbulb-candle'}", "github.com/ajesler/playbulb-candle"
    bin.install "playbulb-candle"
    mkdir_p var/"playbulb-candle"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test playbulb-candle`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
