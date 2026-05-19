class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-darwin-arm64"
      sha256 "ee621c491133c6ee9927bef462c6e011875562ae50911b6cc05368206e162596"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-darwin-amd64"
      sha256 "7595bfdd67b16630b69620ef961c770ee427fda5c16ec444b952db2cef1debb8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-linux-arm64"
      sha256 "c82c2731a6d4542f73819c6685368912da2db9dd8081dedd3b8019d9724aa6a3"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-linux-amd64"
      sha256 "72e2922975fc0060e92861a110bd0ba8a004ddf3d5129674690e00d5a10164d7"
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
