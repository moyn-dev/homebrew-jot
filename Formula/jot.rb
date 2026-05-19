class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/5235a8d9b7de1023fa0c351c58bf211a02a55c9f.tar.gz"
  version "0.1.0"
  sha256 "f32a8314ed140841e8eab6356cce78e2f0cf70f6ffc2ec9bdedf1df27e9300f6"
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
