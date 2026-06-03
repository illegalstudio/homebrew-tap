class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.4/elephc-v0.23.4-aarch64-apple-darwin.tar.gz"
  sha256 "8d465d86cadd7bf1bc597861af37b08ed9004ccd013252de5111f7788d6f1b09"
  version "0.23.4"
  license "MIT"

  depends_on :macos
  depends_on :arch => :arm64

  def install
    bin.install "elephc"
    lib.install "libelephc_tls.a"
  end

  test do
    (testpath/"hello.php").write('<?php echo "hello";')
    system bin/"elephc", "hello.php"
    assert_equal "hello", shell_output("#{testpath}/hello")

    (testpath/"https.php").write('<?php  = fopen("https://example.com/", "r"); echo is_resource();')
    system bin/"elephc", "https.php"
    assert_predicate testpath/"https", :exist?
  end
end
