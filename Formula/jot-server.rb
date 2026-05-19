class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/b245bbea649e2e9bce75a488b20f8f11086599f8.tar.gz"
  version "0.1.0"
  sha256 "4fa10b8755a1c0173ebfa9d2a4e3ae1ea4fd8da5abc3ef830d85248ac5cdb7dc"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w", "-o", bin/"jot-server", "./cmd/jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1", 2)
  end
end
