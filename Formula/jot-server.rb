class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/5235a8d9b7de1023fa0c351c58bf211a02a55c9f.tar.gz"
  version "0.1.0"
  sha256 "f32a8314ed140841e8eab6356cce78e2f0cf70f6ffc2ec9bdedf1df27e9300f6"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w", "-o", bin/"jot-server", "./cmd/jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1", 2)
  end
end
