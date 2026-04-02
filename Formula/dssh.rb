class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v1.0.0/dssh-darwin-arm64.tar.gz"
      sha256 "16a819d832a12db126e9a5609a6438f6f2f0195121687cbd32d2d44db0b0245c"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v1.0.0/dssh-darwin-amd64.tar.gz"
      sha256 "e9b8138202005e94fb559d0d5575fa95df97659225ddfe4676c47efd6c77460b"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
