class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.5/elephc-v0.23.5-aarch64-apple-darwin.tar.gz"
  sha256 "df3542c912d4f2da0ba5b6fc41163784af010ba83bd42261d5f27000c93bd0be"
  version "0.23.5"
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
