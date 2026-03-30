class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.16.1/elephc-v0.16.1-aarch64-apple-darwin.tar.gz"
  sha256 "5a7f50f92d743ebb0885be5a720da8207e85c178fcde08e66ab8fbbf2680d3ef"
  version "0.16.1"
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
