class JotServer < Formula
  desc "Server for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/4933fab46b68b0a3cf12ee89741496db17a82bf5.tar.gz"
  version "0.1.0"
  sha256 "d201526f85e6c7acf6b81b190691a8d4e80d2c5ad78a0b524f6f01c3d5a07e06"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w", "-o", bin/"jot-server", "./cmd/jot-server"
  end

  test do
    assert_match "config", shell_output("#{bin}/jot-server --help 2>&1", 2)
  end
end
