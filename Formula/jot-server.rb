class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-server-darwin-arm64"
      sha256 "8213001ff531bcc6b1e663c22c568258521c851a7aae9672dbd38049dff79be8"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-server-darwin-amd64"
      sha256 "5c81e694fe386e52a288bdcb602c1482c9b656ab500968aa7747323c69789175"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-server-linux-arm64"
      sha256 "3baa2533db337b30aa22909b69ff2b5f0c2504b395f4fb7c00b279cfdabfa753"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-server-linux-amd64"
      sha256 "d9ccf60be065bdf939d537f004452f112e499c77ade4dc5774777823f8dbd8fe"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
