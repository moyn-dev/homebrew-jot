class Jot < Formula
  desc "CLI for the Jot private static-hosting service"
  homepage "https://github.com/skorfmann/jot"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-darwin-arm64"
      sha256 "a7d2daf94d75e521bbe5f776f436ebdc7c70a8160b43d0fe9928855553cfd5c4"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-darwin-amd64"
      sha256 "112f4078fb717f72779bb99f8b09031e20a885da14c5c18a051d3fb9f70577be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-linux-arm64"
      sha256 "910f3458cfea98deb190c4f0b5af1f82dad52fea116681b6c5986fe263f38bc6"
    end

    on_intel do
      url "https://github.com/skorfmann/jot/releases/download/v0.1.8/jot-linux-amd64"
      sha256 "0a180405411b513daad16829ec2703aee8d9d63fd2cce48a72abb9441975122a"
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
