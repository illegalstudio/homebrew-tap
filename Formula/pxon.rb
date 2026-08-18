class Pxon < Formula
  desc "Create and manage Proxmox VE LXC containers"
  homepage "https://github.com/illegalstudio/pxon"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.2.0/pxon_0.2.0_darwin_arm64.zip"
      sha256 "cd1c1eae41619a99f54200208464395bbe21dbed7b08eb917fc00e2fdae247c2"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.2.0/pxon_0.2.0_darwin_amd64.zip"
      sha256 "b41e8ff8dab1fb4033f37295cedfa213e0f13e7de45226d7d1610a765425eee9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.2.0/pxon_0.2.0_linux_arm64.tar.gz"
      sha256 "fc6afa5a5ef53c8abc40f3036e66892b37480ad5a71f716ab60ae5d4801e2087"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.2.0/pxon_0.2.0_linux_amd64.tar.gz"
      sha256 "df255bce8230f0bb48e63531747e510064a51d51d4115ef130c1f64d99879395"
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
