class Context < Formula
  desc "Deterministic, explainable context packs for coding tasks"
  homepage "https://github.com/illegalstudio/context"
  version "0.3.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    depends_on macos: :big_sur
    url "https://github.com/illegalstudio/context/releases/download/v0.3.0/context_0.3.0_darwin_arm64.zip"
    sha256 "0a1b1552a0384fcab0919ff226d8521efec833af75a9dce999cae14b18acd352"
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/context/releases/download/v0.3.0/context_0.3.0_linux_arm64.tar.gz"
      sha256 "a5510ef2440fb3ac260e34c44965809a4ff2d7ccc750c478fbfec315aa9b7a0c"
    end
    on_intel do
      url "https://github.com/illegalstudio/context/releases/download/v0.3.0/context_0.3.0_linux_amd64.tar.gz"
      sha256 "3b299e21de2a961c4b10372e8df4218f166f1cdc29686ae4715c6ebf361e6763"
    end
  end

  def install
    bin.install "context"
    pkgshare.install "LICENSE", "COMMANDS.md", "Cargo.lock", "THIRD_PARTY_NOTICES.md", "licenses"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/context --version")
    assert_match "pack", shell_output("#{bin}/context --help")
    system "#{bin}/context", "index", "--json"
    system "#{bin}/context", "pack", "--task", "Test installation", "--json"
  end
end
