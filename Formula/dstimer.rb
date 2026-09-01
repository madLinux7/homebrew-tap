class Dstimer < Formula
  desc "The Timer for CLI people"
  homepage "https://github.com/madLinux7/dstimer"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-aarch64"
      sha256 "0e91432c65b6b543e2bc8cd21e01c383e014ae9708b5274ff81dafd365ee4e42"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-x86_64"
      sha256 "5ebd45032609baaa1b12557de4a71b1c8bab9ac100a35d2092112b41c5bed73d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-aarch64"
      sha256 "1a014e21a0da8d79a0c0be1279839e342021fba47c8da366d508250337cc8a42"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-x86_64"
      sha256 "9e68e09e9c107cb8ecd9d43bb1f124682bb84211bbf974f927ebd72c2dd19325"
    end
  end

  def install
    binary = Dir["dstimer-*"].first || "dstimer"
    mv binary, "dstimer" if binary != "dstimer"
    chmod 0755, "dstimer"
    bin.install "dstimer"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dstimer --version")
  end
end
