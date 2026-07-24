class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.2.1/dssh-darwin-arm64.tar.gz"
      sha256 "b36d996c629ffd666fc19301dea7cd67311b5762fc22f564146391bc35c2306b"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.2.1/dssh-darwin-amd64.tar.gz"
      sha256 "fb55069b247d0fc5d8ac56a8b269394f63baeb24759679f5e6350e67928db4d9"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
