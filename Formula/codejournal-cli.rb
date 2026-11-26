class CodejournalCli < Formula
  desc "Project memory and work history for developers and coding agents"
  homepage "https://codejournal.online"
  version "0.1.1"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.1/codejournal-cli-v0.1.1-macos-arm64.tar.gz"
      sha256 "18d52435dd9fab980e2e9522190450269ee057eb2bf6910863801d288bce114a"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.1/codejournal-cli-v0.1.1-macos-x64.tar.gz"
      sha256 "368928373a843951a8aeb4ad8994624af61b3d3cced44e0e03443bf6c023602a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.1/codejournal-cli-v0.1.1-linux-arm64.tar.gz"
      sha256 "d49bd50d91042f7ee48599530413f24410c84a39974c034a0a20e05c3b2021f8"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.1/codejournal-cli-v0.1.1-linux-x64.tar.gz"
      sha256 "10f7df8a9c242ed610fe684e43100380814dec210888989ab489c4e68b05bb51"
    end
  end
  def install
    bin.install "cj"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/cj --version")
  end
end
