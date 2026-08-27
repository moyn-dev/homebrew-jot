class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/skorfmann/homebrew-jot"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "549a4f61df38bc57bbdd42dafcd0de9293d93742cb62480f02992d09e69c533c"
    end

    on_intel do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "1f4857ad8fcaddee3977adc1f919b02b70b91f8d61434b508f34f612848c479b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "56d03aeb9dc5e4736b98e6d50761a9a90d86a83e472f46069f358fed9f097958"
    end

    on_intel do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "5fc93fedf43dd82271b3f69b7d5ff68b140fb16d279cc55db19239b498acd1b1"
    end
  end

  def install
    bin.install Dir["jot-*"].first => "jot"
  end

  def caveats
    <<~EOS
      This formula installs `jot`, which on macOS shadows the BSD `jot`
      utility. Invoke /usr/bin/jot when you need the BSD utility.
    EOS
  end

  test do
    assert_match "Push private static artifacts", shell_output("JOT_NO_AUTO_UPDATE=1 #{bin}/jot --help")
    assert_match "jot v#{version}", shell_output("JOT_NO_AUTO_UPDATE=1 #{bin}/jot version")
  end
end
