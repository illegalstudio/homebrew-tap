class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.18.4/elephc-v0.18.4-aarch64-apple-darwin.tar.gz"
  sha256 "01663ba3752c046ca38937e733bb0fd3a5c8c6b6e456b82a7b0a6b451b796835"
  version "0.18.4"
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
