class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.2.0/dssh-darwin-arm64.tar.gz"
      sha256 "ce3bf102552ac153fb7bf4e45c65c19b886cd5c089c53373ced790604bebb2c4"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.2.0/dssh-darwin-amd64.tar.gz"
      sha256 "09425a61842bdeaa51cd159d6744aaa2884ada8eebd1b1d51b8e6d5c6fb40631"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
