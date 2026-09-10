class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/moyn-dev/homebrew-jot"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "897219eced43ea254a2f8a064d08dfa9ec2d8559e658243653d2e76e49b01d48"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "a22a72ecb076de5a285e5c45a75fbf23809f5937f48bb5ccdaab79b614330e40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "4addea6077d7d9b60cc1c780cfba3008a95687c6ee74039cb048324e3761a5fc"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "3e447847a46d5a1fd50e0c39b0ff849460f71ba5f36581b35a149c2184e1048e"
    end
  end

  def install
    bin.install Dir["jot-*"].first => "jot"
  end

  def caveats
    <<~EOS
      This formula installs `jot`, which on macOS shadows the BSD `jot`
      utility. Invoke /usr/bin/jot when you need the BSD utility.
    EOS
  end

  test do
    assert_match "Push private static artifacts", shell_output("JOT_NO_AUTO_UPDATE=1 #{bin}/jot --help")
    assert_match "jot v#{version}", shell_output("JOT_NO_AUTO_UPDATE=1 #{bin}/jot version")
  end
end
