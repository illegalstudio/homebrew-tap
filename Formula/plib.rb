class Plib < Formula
  desc "A prompt library for your terminal"
  homepage "https://github.com/illegalstudio/prompt-library"
  version "0.1.1"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.1/plib_0.1.1_darwin_arm64.zip"
      sha256 "1c621a68e2b98669b908eaa55720f37126a4df761814c59533a955ef12893e19"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.1/plib_0.1.1_darwin_amd64.zip"
      sha256 "a63c5b50b15b8b37f6369bbae7d9ebf46d36ded7b5d24b61e28febe879d64ae8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.1/plib_0.1.1_linux_arm64.tar.gz"
      sha256 "b6b9052d664a620505a51b2299a31adef7ccdec413e027906fa70d8879cb358a"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.1/plib_0.1.1_linux_amd64.tar.gz"
      sha256 "094017ae145c72a2fee7d16a058c38a29bfc49f82ba9a6c9859365e8310916bd"
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
