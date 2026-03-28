class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.14.0/elephc-v0.14.0-aarch64-apple-darwin.tar.gz"
  sha256 "32ed26171ecbc859d2ec0b79c4c55ef73ce19f2bd56237c70ad9c486f4968f7b"
  version "0.14.0"
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
