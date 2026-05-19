class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-darwin-arm64"
      sha256 "ebd43cf84b52007e8ae677f34fba26dc46a8676639505e9452bf78d4358daa7c"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-darwin-amd64"
      sha256 "6c91b1259a018c61f16f511687d7b7995d84ac238a168ac43758286a998d7536"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-linux-arm64"
      sha256 "0a098e0a5307da84c001120fdef18fb7b4449e0ce0083438889b3d2a887c5e21"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-linux-amd64"
      sha256 "f09b643eb1329d9695fff306a6d634a03fb50942d48c1c6fc1104637a893361d"
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
