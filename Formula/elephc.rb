class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.22.0/elephc-v0.22.0-aarch64-apple-darwin.tar.gz"
  sha256 "b04bb874e92e5a7c7aa7764ac2b89d9b78dcc575f3c8ccbe2887e85154dcf5b0"
  version "0.22.0"
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
