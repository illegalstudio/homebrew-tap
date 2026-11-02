class Plib < Formula
  desc "A prompt library for your terminal"
  homepage "https://github.com/illegalstudio/prompt-library"
  version "0.1.0"
  license "MIT"

  depends_on "git"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.0/plib_0.1.0_darwin_arm64.zip"
      sha256 "7b190fd7ad1278b22a4f2c29bec0780e7d4c80bfa27316fb2a55e25623ed00db"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.0/plib_0.1.0_darwin_amd64.zip"
      sha256 "3feda69c445118fb63d541daa11867f6b79e0f3264954544a17808fcc64418d5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.0/plib_0.1.0_linux_arm64.tar.gz"
      sha256 "991c47b6d8aa621beeb55307fb4a03592683237fcb036d5de76719a8addd9774"
    end
    on_intel do
      url "https://github.com/illegalstudio/prompt-library/releases/download/v0.1.0/plib_0.1.0_linux_amd64.tar.gz"
      sha256 "ca1103cef5932bc8979edc516ab2aae027efb5d69d530b728307c8cdab7f122f"
    end
  end

  def install
    bin.install "plib"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/plib --version")
    assert_match "prompt library", shell_output("#{bin}/plib --help")
  end
end
