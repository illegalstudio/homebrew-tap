class Pxon < Formula
  desc "Create and manage Proxmox VE LXC containers"
  homepage "https://github.com/illegalstudio/pxon"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.3.0/pxon_0.3.0_darwin_arm64.zip"
      sha256 "9170d9b4f2390c62b349e803780c900d0158963a881757d2b44de4ea3defd0c4"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.3.0/pxon_0.3.0_darwin_amd64.zip"
      sha256 "7a8388cb676e9d6ffca77e14abfa1938277bcc4ad2f47f3476d4c3e100688985"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.3.0/pxon_0.3.0_linux_arm64.tar.gz"
      sha256 "f496109bf6e671be7703e9729b53ceb731a0e4c386a0d3756e638143a01f7415"
    end
    on_intel do
      url "https://github.com/illegalstudio/pxon/releases/download/v0.3.0/pxon_0.3.0_linux_amd64.tar.gz"
      sha256 "57597cb2acc6331bf3f0c6a229b78bf1a453b25718609cdd5386a71ae2d014c2"
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
