class Jot < Formula
  desc "CLI for the Jot private app platform"
  homepage "https://github.com/moyn-dev/homebrew-jot"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "a32968b4918fcc9b418e2aa1a936bfe0590fb51ed808460a0fd364f7e333aea3"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "f3186b98733238b5f2425cebc60df2d3418f9a6a74250d92b712364ec398eac0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "3f37baffafe2f875638f3197dabdfa8f29368cf311585cb5a81ea5197af29894"
    end

    on_intel do
      url "https://github.com/moyn-dev/homebrew-jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "300344e4ab9537bf2a7a43c60d9ed7e249bb2309e61cc8a7d3e3525afda61182"
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
