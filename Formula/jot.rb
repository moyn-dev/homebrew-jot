class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/moyn-dev/homebrew-jot"
  version "0.7.1"

  on_macos do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "2dc84585510f067a6991c6187217d665ad78b630be043dbe0ca44460176baf43"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "536d7503f373178ed0901ac0543bddf6de7c3f2c13cd089f4d752992cb889db4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "453a0598307079494e16fa2ae82c9d85a0d8a0f2dcf3d62e06307e5de3a8a558"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "2e56d964db532d1860e93973cb808d01f55fd2d67455797141c8a183522af8d1"
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
