class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-server-darwin-arm64"
      sha256 "0e545792eb94dcf27b510ea52dd52699c4895513a809b00311c1b967d0002b2c"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-server-darwin-amd64"
      sha256 "840019d7d2e8b123fb798a291fd6c63ae082082c9c3ca85ee123b44454755cea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-server-linux-arm64"
      sha256 "aaa99c430e89c0185651bd4f66fbc1ff4b321d5aaa8828ea4ff49da080b8e1c6"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.2/jot-server-linux-amd64"
      sha256 "3dbda51fd434073cd2ab063a02415af1a0479c5a242105715f501f2821479ebb"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
