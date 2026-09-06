class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/moyn-dev/homebrew-jot"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "a2604e5ec4804ecec2d5a4a63073ad952eb220c05e450dbc95eaa3118faf021b"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "752422d9d4cba8ba38da86d93ca233ddbc1ea196986ce505f00841339b9494c6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "4c3d0a6b3af9ad536388d21c4305a6c60610371ed62146a3dbe9d316caa3a0ca"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "59d8b2c4a7d60307ea2f938785918650e32b0226f70516eb1e1c5f25968f6999"
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
