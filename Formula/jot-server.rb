class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-server-darwin-arm64"
      sha256 "780f749b6073b242e74d5d91cd3a3dbb490de8edfdeee479811a0f2728883dd0"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-server-darwin-amd64"
      sha256 "e1fddd8a0efcfd76fec0aa9e204f2efc80440227895f44de00422a1ff0c4feb9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-server-linux-arm64"
      sha256 "55e9201b86f6450e0dd0a866710dc1a3fbb33a39c47d33a71da04c42fbfa71d5"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.0/jot-server-linux-amd64"
      sha256 "d33d7643fa38dc1fbd09000d18d185518de9c0c46c0a1662606ad625bd39d9b5"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
