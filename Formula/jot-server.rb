class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-server-darwin-arm64"
      sha256 "c78efcd607596227ca36e847e1aa8345b3dfe7449c2e5fd47f3deff46723de80"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-server-darwin-amd64"
      sha256 "289def5a39fc62e9e859370b2a3d3daf6f8ecd7859c8203587ab79fbd2d659f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-server-linux-arm64"
      sha256 "33a4228ccb5164a2eab9556d70f0dc5488118db23207458733f7ad73c15c078e"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-server-linux-amd64"
      sha256 "0e339e9a515fab5f12ce4ed29bbcac8be5f0807242d4be868c72f82a96d99b06"
    end
  end

  def install
    bin.install Dir["jot-server-*"].first => "jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1")
  end
end
