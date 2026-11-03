class Plib < Formula
  desc "A prompt library for your terminal"
  homepage "https://github.com/illegalstudio/prompt-library"
  version "0.1.3"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.3/plib_0.1.3_darwin_arm64.zip"
      sha256 "b625cb109e3226f6a79fe55e26579c923efc8486462d8560c5a15cde7af5dfc3"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.3/plib_0.1.3_darwin_amd64.zip"
      sha256 "25a867ae4b2af5820b63ce78eb8277e6d286cba0c86a9b5e9d6ec78e851fdba0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.3/plib_0.1.3_linux_arm64.tar.gz"
      sha256 "ae6f69ae055f1e26a6f60768cf16ce016c97b0d8b6f2f7bb5a057b7279ea4dda"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.3/plib_0.1.3_linux_amd64.tar.gz"
      sha256 "635c22fe312b7ef56364f0e9b97edd360fb327148ee053b686ed92c6e449fa93"
    end
  end

  def install
    bin.install "plib"
  end

  def caveats
    "Install the bundled AI agent skill with: plib skills install"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plib --version")
    assert_match "prompt library", shell_output("#{bin}/plib --help")
    assert_match "skills", shell_output("#{bin}/plib --help")
  end
end
