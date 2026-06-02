class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.3/elephc-v0.23.3-aarch64-apple-darwin.tar.gz"
  sha256 "caf827068e1cfc89f72c6b55dc0306ed90c126b58bb0bc3c3a7acc7ff0b488fe"
  version "0.23.3"
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
