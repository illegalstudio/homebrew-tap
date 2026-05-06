class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.20.9/elephc-v0.20.9-aarch64-apple-darwin.tar.gz"
  sha256 "47b2d6ae58cdf01f6f5cb5c079265363fbc28c50f5d74e9b0810cb4a561a0f17"
  version "0.20.9"
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
