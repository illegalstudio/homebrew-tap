class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.21.14/elephc-v0.21.14-aarch64-apple-darwin.tar.gz"
  sha256 "c9d559e1f1c7ecfc89ce6fe8210d07ced1794c5e9a2f8365abf486dbc0a3592d"
  version "0.21.14"
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
