class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.18.5/elephc-v0.18.5-aarch64-apple-darwin.tar.gz"
  sha256 "ec4f6d23059b01ec76ea61f2787ae76493fd0f6fcbc068089b4a7140578ee1d6"
  version "0.18.5"
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
