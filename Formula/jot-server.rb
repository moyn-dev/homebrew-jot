class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-server-darwin-arm64"
      sha256 "2b24a954b13e951051e4708fc6f6e1740f145b16a2f2efab3609e93e00b57165"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-server-darwin-amd64"
      sha256 "b7e3d2f0c8fbc814a6bc1dfa18381fe57534332806cd3fcb280ebecafe699f82"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-server-linux-arm64"
      sha256 "b71900d727a102bb8fd494bf94bbebd7779315a332371c035dd03f1b7564ce76"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-server-linux-amd64"
      sha256 "fc621039f672add815a4dc2a04464def05f626972aaeb95d461e16cb36a8ef7a"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
