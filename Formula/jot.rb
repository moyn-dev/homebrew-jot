class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  url "https://github.com/skorfmann/jot/archive/b245bbea649e2e9bce75a488b20f8f11086599f8.tar.gz"
  version "0.1.0"
  sha256 "4fa10b8755a1c0173ebfa9d2a4e3ae1ea4fd8da5abc3ef830d85248ac5cdb7dc"
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
