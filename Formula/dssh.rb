class Dssh < Formula
  desc "Dead Simple SSH - TUI-based SSH connection manager"
  homepage "https://github.com/madLinux7/dssh"
  version "2.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/madLinux7/dssh/releases/download/v2.0.1/dssh-darwin-arm64.tar.gz"
      sha256 "b38061fc5234a030cf5900d3f05127f20855e0f3c017c98011d7e1b07cef6276"

      def install
        bin.install "dssh-darwin-arm64" => "dssh"
      end
    elsif Hardware::CPU.intel?
      url "https://github.com/madLinux7/dssh/releases/download/v2.0.1/dssh-darwin-amd64.tar.gz"
      sha256 "d5178f7920f98d080fdd1edb49ae785b9edad2edb7032799bb14ba9dcd1b40f8"

      def install
        bin.install "dssh-darwin-amd64" => "dssh"
      end
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dssh --version")
  end
end
