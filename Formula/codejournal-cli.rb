class CodejournalCli < Formula
  desc "Project memory and work history for developers and coding agents"
  homepage "https://codejournal.online"
  version "0.1.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-macos-arm64.tar.gz"
      sha256 "5dbbd1bc3df871a75e33e66985a2d12ce0691522a5db87586966b066b4e1177d"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-macos-x64.tar.gz"
      sha256 "7dfbf2ed931f2c7331b5b1fd84f85d041691f99121ccbb503237a0b28c5a6fb4"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-linux-arm64.tar.gz"
      sha256 "5ad33d4bd287dfc4fbfb97e1221675d476766bee5e9e9777831ebc2ab3218ed6"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-linux-x64.tar.gz"
      sha256 "8522f491f8f196ca8c35e83bf06d24639e5b63cf9fcab6b633251482ff46c8c8"
    end
  end
  def install
    bin.install "cj"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/cj --version")
  end
end
