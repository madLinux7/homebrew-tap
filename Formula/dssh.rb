class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.1.0/dssh-darwin-arm64.tar.gz"
      sha256 "ef678de6cf340027a7120651efc9399d8e9091af62c15a784d21c2d067535593"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.1.0/dssh-darwin-amd64.tar.gz"
      sha256 "5cccbfb47a0f1e610e4ddec31944a643889775d4a597ed27327a71e013144b5b"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
