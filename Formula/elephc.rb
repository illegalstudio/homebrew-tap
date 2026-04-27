class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.19.11/elephc-v0.19.11-aarch64-apple-darwin.tar.gz"
  sha256 "e0bedc9067f5c4fa8cf00ae2bb45e211ed12e4b0125cc9a23fa5a3bb63e49f3d"
  version "0.19.11"
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
