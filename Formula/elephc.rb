class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.0/elephc-v0.23.0-aarch64-apple-darwin.tar.gz"
  sha256 "a0a1fb75b6b18028e0efe0fbe9ee8d73ef8fbbc6d16dffbb3cbbe67b758042f1"
  version "0.23.0"
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
