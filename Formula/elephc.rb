class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.8.1/elephc-v0.8.1-aarch64-apple-darwin.tar.gz"
  sha256 "e59dce5fbeb0a25050d10b6c48acd4444d500dc4a399d2f1ccd88f77d3338f9c"
  version "0.8.1"
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
