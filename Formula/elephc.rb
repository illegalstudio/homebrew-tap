class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.21.6/elephc-v0.21.6-aarch64-apple-darwin.tar.gz"
  sha256 "6cf5a3d3982f805cf1e3f99e0da7498186a01211d415b01071133b31f6dd9bcc"
  version "0.21.6"
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
