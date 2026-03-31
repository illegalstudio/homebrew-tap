class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.16.6/elephc-v0.16.6-aarch64-apple-darwin.tar.gz"
  sha256 "8fd58f1d46fcb4366b6a2807f25a5ebabaed9fcf3d4e6bceee1ac90085af54ff"
  version "0.16.6"
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
