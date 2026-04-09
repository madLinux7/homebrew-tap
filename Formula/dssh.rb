class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.0.2/dssh-darwin-arm64.tar.gz"
      sha256 "de780fd15e2c8cf9fabd7fa391d1b438deb749255caea335a976d4f57d5fbf3c"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.0.2/dssh-darwin-amd64.tar.gz"
      sha256 "dab33193cca467beb1cdc62d048391b9cb49a8c95e600c576a4fd41d3518f488"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
