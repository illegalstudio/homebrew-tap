class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.16.8/elephc-v0.16.8-aarch64-apple-darwin.tar.gz"
  sha256 "da7d5f506334aca66575eb48cf5e7dec41c57fcc78d0a8523ae611f99ba537d9"
  version "0.16.8"
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
