class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/moyn-dev/homebrew-jot"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "1426b0ee68a120a37919974d85e2ebabd06ad741bceb85f24011a0972ffda964"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "3ea147279e1df0bf5eb29e3bf08c0cefa28fd6fe0587773d2639b4abcbd9ff21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "e6c51b470c3ea7e1d83e5c28bd81a891cadd386193a7c8c2e2aa165e6c0b3b10"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "37f2033530b4c213a20277da9351c0c575b54c6104b615e24282ef7e5948dd62"
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
