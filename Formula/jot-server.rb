class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-server-darwin-arm64"
      sha256 "bd8d8d428aa2ce59e3a2947e1ab46a23bd0d3a8a1295c1375bdb7c6c023062a9"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-server-darwin-amd64"
      sha256 "6de923738f03c21c830cbd399e0261601c38dc7fa43eef280277d3b4d7fe95a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-server-linux-arm64"
      sha256 "194db057dd5c2463d95ec8a88788a6e739982fc49c44103bb5a3fe9a9b003172"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.6/jot-server-linux-amd64"
      sha256 "5db7ca16fc7061d4a2550c3a910de4e070eddd31880534b0a191098bdff20b12"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
