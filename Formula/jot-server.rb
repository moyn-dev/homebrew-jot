class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-server-darwin-arm64"
      sha256 "b778f796df61387031365772f4cb8b6f5c0ac7ef650f490fe1de27713cd9631e"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-server-darwin-amd64"
      sha256 "b61b79fffde5b3c4ab32e2c485a695075facf28b9612a58bf69613853c8cc7b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-server-linux-arm64"
      sha256 "1e3011ab0159cd988e342a8adffac7cd737cbe59505139041e10c95a957c7088"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.3/jot-server-linux-amd64"
      sha256 "2878b658da7fe90dab5be982759809662c001a641e27bbd8548cdd11c60cef6e"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
