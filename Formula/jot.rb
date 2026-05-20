class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-darwin-arm64"
      sha256 "6c5d0a5af9e1a66162cef77827660879bcc0c9967e14f2f2dfd938139a9b85b9"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-darwin-amd64"
      sha256 "783fcf3a2095a1b6a190c8b25b02fc3dfe8c57e79d73a9786d21583859313f57"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-linux-arm64"
      sha256 "ad23c3596935b3db3b3509ed9bca10b00e9a833599d476052180353176699c81"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-linux-amd64"
      sha256 "93153252607af91baf8ad8a5002f7060cb1dff80b63de98e70cf9100d529dd54"
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
