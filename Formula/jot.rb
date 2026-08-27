class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/skorfmann/homebrew-jot"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "e15358bf22e629a3144548203a6c13d151367ecc7606e1d1a0b1ee64d2b3cd26"
    end

    on_intel do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "77adc4d0bc89691b438df9a5a365ff6d9115f41302e4785cb81689476b7dd185"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "cdd45f64c2d44ea8555a3819c161cd2062aa2cfe82664390f05e78e24cb517a9"
    end

    on_intel do
      url "https://github.com/skorfmann/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "6860671587129c80a7ea54c9c27b517844e3c5c085fb5392a161d4bbfcd0a7fb"
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
