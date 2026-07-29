class Pxon < Formula
  desc "Create and manage Proxmox VE LXC containers"
  homepage "https://github.com/illegalstudio/pxon"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.0/pxon_0.1.0_darwin_arm64.zip"
      sha256 "74b81f42e65103d0fd5ff1a93348abf1cbc88ede6c6a6951892722b920dc3314"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.0/pxon_0.1.0_darwin_amd64.zip"
      sha256 "0956603a5dc2ef61c9bfea850b140b3131655f20b2a8ad81c6223159807bf41a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.0/pxon_0.1.0_linux_arm64.tar.gz"
      sha256 "4794afddaab031616087d8a1469a4f6bb27f1bb19301c0b375346640156115f2"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.0/pxon_0.1.0_linux_amd64.tar.gz"
      sha256 "62f1ffeeabaf94752654306e28e68fc70517822fae5979f996f9983200523e69"
    end
  end

  def install
    bin.install "pxon"
  end

  test do
    assert_match "pxon v#{version}", shell_output("#{bin}/pxon --version")
  end
end
