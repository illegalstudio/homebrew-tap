class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.21.0/elephc-v0.21.0-aarch64-apple-darwin.tar.gz"
  sha256 "3ab92b4649cd51fec944128ce88dea491cbe0dd6c7ba7d64260fc9e144fe5660"
  version "0.21.0"
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
