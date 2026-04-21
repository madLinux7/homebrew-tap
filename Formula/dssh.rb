class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.1.1/dssh-darwin-arm64.tar.gz"
      sha256 "c9161038e69a6f9693a388b52ee6978403796b05c0878081e8ec33cb2424065a"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.1.1/dssh-darwin-amd64.tar.gz"
      sha256 "23216e793809a77f8beb874f5b68a47afd1350ef78e167c61d889b5fa6594876"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
