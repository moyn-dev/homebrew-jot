class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-darwin-arm64"
      sha256 "4de5092f2cdd9a9ff685d55040aca84d3e562342935a59e87d678e39f6f7b7a5"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-darwin-amd64"
      sha256 "09a59eb13a01bbe51d6cf80efdcb51e55a9bcf27577d419bb8f433ea9cb23398"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-linux-arm64"
      sha256 "abf0b84190397fbfa5c6d94c77053db24f5413f6a2cd7e61a207698749970a6c"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-linux-amd64"
      sha256 "20e140badf05f6bf504a841a826da2290b65e39c22bc3d519ec84ed295e7d307"
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
    output = shell_output("#{bin}/jot --help")
    assert_match "Push private static artifacts", output
    assert_match "Examples:", output
  end
end
