class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.16.3/elephc-v0.16.3-aarch64-apple-darwin.tar.gz"
  sha256 "c68bb2e86650f1ee6d59e53a032af6354be8e3438eeb8f1177ad50705f7bab06"
  version "0.16.3"
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
