class Dstimer < Formula
  desc "The Timer for CLI people"
  homepage "https://github.com/madLinux7/dstimer"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-aarch64"
      sha256 "4d445067ab04d7c1215bcd159eb04ecd956ba83727b4a8a6bdcbcb23adccd1b1"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-macos-x86_64"
      sha256 "abf99cb252163aa1e139b5be977ba14bdc3fd4e3d2dfb07ae0feb7414904f877"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-aarch64"
      sha256 "604840c0439579697a89a566cdad37f77f11be1ab0af7e872f2d1303637e7623"
    else
      url "https://github.com/madLinux7/dstimer/releases/download/v#{version}/dstimer-linux-x86_64"
      sha256 "0f8942dd39e88a92cf7601be00f367378d049be60d1bba818ac9a98f5d268b1c"
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
