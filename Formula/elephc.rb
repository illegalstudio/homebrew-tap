class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.21.2/elephc-v0.21.2-aarch64-apple-darwin.tar.gz"
  sha256 "7fb449004f21217e7480ea665a3c9ce786c79e318e4dc3e47f11d86e344b3ae0"
  version "0.21.2"
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
