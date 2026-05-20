class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-server-darwin-arm64"
      sha256 "4dfc640361837a02c18aab14bf33187c1557ef99d1a564f6a55836f34b479de0"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-server-darwin-amd64"
      sha256 "dadfe761da908a6b960fd596512ecbd4afe29c2addd5ffadacba78ad0be0a607"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-server-linux-arm64"
      sha256 "89627aa2e6a5d694b3b25a18268a150ba6085b9cb9a77cefa67ee6f25f7940e1"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.4/jot-server-linux-amd64"
      sha256 "7df1228aaf8e6df697dac2673c5de0ce515083bdc721a22fe643a214e7308fc6"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
