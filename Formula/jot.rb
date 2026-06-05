class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-darwin-arm64"
      sha256 "b647a69d31edf23cb555b9cae830ff1b6a8695ff8c66b65491040a0d2f136cf1"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-darwin-amd64"
      sha256 "416342756dbabb2e57a903326eead59f23337d36d27e8104328c7a3b917d8613"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-linux-arm64"
      sha256 "29d9f06079acc6ae7fba750e75c1fb65c83a5bb4bfe756ed524462f95f018bbc"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v#{version}/jot-linux-amd64"
      sha256 "0d6b6bc24ef0461b81cf0c76f25117f70517da3f14c8424510e082b14d4700c7"
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
