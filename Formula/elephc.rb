class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.16.5/elephc-v0.16.5-aarch64-apple-darwin.tar.gz"
  sha256 "7ff90f7857d2b6cf616d7b5e66a5527af97d0d842bcdd1506fdf7cb5855f82d7"
  version "0.16.5"
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
