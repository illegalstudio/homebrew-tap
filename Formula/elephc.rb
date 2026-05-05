class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.20.6/elephc-v0.20.6-aarch64-apple-darwin.tar.gz"
  sha256 "50eab1e60436213450789b5087c2175aa73f77524fec4a3a8810069ace915a61"
  version "0.20.6"
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
