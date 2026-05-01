class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.19.13/elephc-v0.19.13-aarch64-apple-darwin.tar.gz"
  sha256 "b45b1e1216b4f5fb45ce1a2387dc67789c4cfc5558a01978c57c4d097dfa7b29"
  version "0.19.13"
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
