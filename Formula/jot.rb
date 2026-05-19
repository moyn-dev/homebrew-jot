class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/4933fab46b68b0a3cf12ee89741496db17a82bf5.tar.gz"
  version "0.1.0"
  sha256 "d201526f85e6c7acf6b81b190691a8d4e80d2c5ad78a0b524f6f01c3d5a07e06"
  depends_on "go" => :build

  def install
    system "go", "build", "-trimpath", "-ldflags=-s -w", "-o", bin/"jot", "./cmd/jot"
  end

  def caveats
    <<~EOS
      This formula installs `jot`, which on macOS shadows the BSD `jot`
      utility (a number-sequence generator). To use the BSD jot, invoke it as
      /usr/bin/jot.
    EOS
  end

  test do
    assert_match "Push private static artifacts", shell_output("#{bin}/jot --help")
  end
end
