class Dstimer < Formula
  desc "The Timer for CLI people"
  homepage "https://github.com/madLinux7/dstimer"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-aarch64"
      sha256 "276d855237046205bc7a25a15fca46ce88704776a7f51332b12d66791345c6bf"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-x86_64"
      sha256 "1aca33f81f55c00b7cd8bfb8372b63cd0481ed1d83e87040f4ebe47fd37fa12e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-aarch64"
      sha256 "3eb493d9e7d7a849c2e253188601488602a30e03056b8c254aa73ae3b564aea8"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-x86_64"
      sha256 "589e9cc0ffd82293c152d82f71265247e34fa16753769d47ed6b5e290b1bf66e"
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
