class Ggw < Formula
  desc "Git worktrees, ergonomic — store all worktrees of all your repos in a predictable location"
  homepage "https://github.com/illegalstudio/ggw"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.3/ggw_0.1.3_darwin_arm64.zip"
      sha256 "da9560184a06ea5ef6ead2da5d19302ee924a74eab6f0eeb1f0a1e68c78f92fd"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.3/ggw_0.1.3_darwin_amd64.zip"
      sha256 "e07147e04df9ae88c335b78eea50ecde4f937df08c6fa37f11680c2ef82c3451"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.3/ggw_0.1.3_linux_arm64.tar.gz"
      sha256 "30493cd5b81c0b2582fb20923d59594d9f223c711db1cf3fedd72ef733e30bb2"
    end
    on_intel do
      url "https://github.com/illegalstudio/ggw/releases/download/v0.1.3/ggw_0.1.3_linux_amd64.tar.gz"
      sha256 "909379ca2205368fb1fb1b8fb6609c9da5320920768a9d56f83bd16b965cf906"
    end
  end

  def install
    bin.install "ggw"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ggw --version")
  end
end
