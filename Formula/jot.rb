class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-darwin-arm64"
      sha256 "fc9ef566978ba9bd0a495b1487bcf1734f9ae8ea35406965378864d95ce73913"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-darwin-amd64"
      sha256 "bb7a2d0d79eba65c0f97465a05c420e1f3c5d4bd1d9a75a026bda28a5365bf82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-linux-arm64"
      sha256 "17490b809f6102af416c5fc56ecc4e7d0f232867888e978871840dbc96d7767f"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-linux-amd64"
      sha256 "f323ec46c26fe92ac45a875ec819a5c12452ab62857821f9574d7807087c6dc8"
    end
  end

  def install
    bin.install Dir["jot-*"].first => "jot"
  end

  def caveats
    <<~EOS
      This formula installs `jot`, which on macOS shadows the BSD `jot`
      utility (a number-sequence generator). To use the BSD jot, invoke it as
      /usr/bin/jot.
    EOS
  end

  test do
    assert_match "Push private static artifacts", shell_output("#{bin}/jot --help")
  end
end
