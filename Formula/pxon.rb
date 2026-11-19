class Pxon < Formula
  desc "Create and manage Proxmox VE LXC containers"
  homepage "https://github.com/illegalstudio/pxon"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.4.0/pxon_0.4.0_darwin_arm64.zip"
      sha256 "68b6722040ee5558fe3c9b10735d791ed2ba183e934bf27b1e1c838c562e6eb1"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.4.0/pxon_0.4.0_darwin_amd64.zip"
      sha256 "f383b6d83958a4436cdbc1e988fcdbe859c213d5f0f1834d665fb175efa773bc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.4.0/pxon_0.4.0_linux_arm64.tar.gz"
      sha256 "990d024befb4edddb29790c22a31b9888db233817998fa30bcb3e0f82e376b98"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.4.0/pxon_0.4.0_linux_amd64.tar.gz"
      sha256 "b7d6084db09d028038887cfa08546f0c25007a856db959d2ad9ee8284bb123b4"
    end
  end

  def install
    bin.install "pxon"
  end

  def caveats
    <<~EOS
      Install the bundled PXON skill for AI agents with:
        pxon skills install
    EOS
  end

  test do
    assert_match "pxon v#{version}", shell_output("#{bin}/pxon --version")
    assert_match "skills", shell_output("#{bin}/pxon --help")
  end
end
