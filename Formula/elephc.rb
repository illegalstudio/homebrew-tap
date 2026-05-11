class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.21.1/elephc-v0.21.1-aarch64-apple-darwin.tar.gz"
  sha256 "29024174d49c4f2d18a2ab1812fcdc4f52bc10fc37b8f88d0b2d8de54e1b8a0e"
  version "0.21.1"
  license "MIT"

  depends_on :macos
  depends_on :arch => :arm64

  def install
    bin.install "elephc"
  end

  test do
    (testpath/"hello.php").write('<?php echo "hello";')
    system bin/"elephc", "hello.php"
    assert_equal "hello", shell_output("#{testpath}/hello")
  end
end
