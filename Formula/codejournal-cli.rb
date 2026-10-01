class CodejournalCli < Formula
  desc "Project memory and work history for developers and coding agents"
  homepage "https://codejournal.online"
  version "0.1.0"
  license "MIT"
  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-macos-arm64.tar.gz"
      sha256 "de7fb317e088de4fd9fb810fc86cd74e1899c22198ffc8a97e8f8e50db0b894d"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-macos-x64.tar.gz"
      sha256 "0a07bab703fb01180fd861385863b4e8f40644e5f4369a77c6b24e73b60e1157"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-linux-arm64.tar.gz"
      sha256 "a79d16920accfe969298faae9bba07312e1da9c77bcc85f37bcfb9238e273ac6"
    end
    on_intel do
      url "https://github.com/illegalstudio/codejournal-cli/releases/download/v0.1.0/codejournal-cli-v0.1.0-linux-x64.tar.gz"
      sha256 "a20f53d3c1b45e05457c0ca59e61132c3f288e1fce4175b81dbdd178b819ce31"
    end
  end
  def install
    bin.install "cj"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/cj --version")
  end
end
