class Pxon < Formula
  desc "Create and manage Proxmox VE LXC containers"
  homepage "https://github.com/illegalstudio/pxon"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.1/pxon_0.1.1_darwin_arm64.zip"
      sha256 "36b75dc8429dd917e4f12b294ebaa46da50dd5ca3985edd65e920d25f84f767c"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.1/pxon_0.1.1_darwin_amd64.zip"
      sha256 "0f93e830530ace8dc7ce2acef8a37ebb1db9be149bd70680685abde3f1aae2cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.1/pxon_0.1.1_linux_arm64.tar.gz"
      sha256 "d78279954ab51851d7831f444db52c9a5dead712b23badf93fa1552990ec45b3"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.1.1/pxon_0.1.1_linux_amd64.tar.gz"
      sha256 "35ad53e05f67df2978ca6e86f795e184a940063380251acc46aa158f5549a075"
    end
  end

  def install
    bin.install "pxon"
  end

  test do
    assert_match "pxon v#{version}", shell_output("#{bin}/pxon --version")
  end
end
