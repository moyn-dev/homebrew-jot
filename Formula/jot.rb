class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-darwin-arm64"
      sha256 "d24716331f7ecb48e035233194f67235ee58681c875cf94fdbbdedf9c979c7ec"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-darwin-amd64"
      sha256 "44f2fc62aaffd71416743ea9761df6626884241b21c4fc4639b021d3551ad98c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-linux-arm64"
      sha256 "30d0470a8d99f1c30b405bf6409fedb8611ca3f5f424512e7fe1d72349cc1406"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.1/jot-linux-amd64"
      sha256 "c1cc1120341342da3e9beef4837aba31ecf57284dec27c3bd449a64f25b374ef"
    end
  end

  def install
    bin.install Dir["jot-*"].first => "jot"
  end

  def caveats
    <<~EOS
      This formula installs `jot`, which on macOS shadows the BSD `jot`
      utility (a number-sequence generator). To use the BSD jot, invoke it as
      /usr/bin/jot.
    EOS
  end

  test do
    output = shell_output("#{bin}/jot --help")
    assert_match "Push private static artifacts", output
    assert_match "Examples:", output
  end
end
