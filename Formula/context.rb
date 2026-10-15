class Context < Formula
  desc "Deterministic, explainable context packs for coding tasks"
  homepage "https://github.com/illegalstudio/context"
  version "0.3.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :big_sur
    url "https://github.com/illegalstudio/context/releases/download/v0.3.1/context_0.3.1_darwin_arm64.zip"
    sha256 "3a22bdbb32059b1d70307393d1126b50fb5c6b9736476a5f2cabc755b04220fd"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/context/releases/download/v0.3.1/context_0.3.1_linux_arm64.tar.gz"
      sha256 "62f5d8b4e6691a216dc7d8a5c489c6aac4dad61f8897391dce53d5161896549f"
    end
    on_intel do
      url "https://github.com/illegalstudio/context/releases/download/v0.3.1/context_0.3.1_linux_amd64.tar.gz"
      sha256 "2e165070ca5c7201e7687ec4ae2c988b06418d74b204a8916898cabfeabb1c1b"
    end
  end

  def install
    bin.install "context"
    pkgshare.install "LICENSE", "COMMANDS.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/context --version")
    assert_match "pack", shell_output("#{bin}/context --help")
    system "#{bin}/context", "index", "--json"
    system "#{bin}/context", "pack", "--task", "Test installation", "--json"
  end
end
