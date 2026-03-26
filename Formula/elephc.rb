class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.9.1/elephc-v0.9.1-aarch64-apple-darwin.tar.gz"
  sha256 "ac9f4303a4a9b3e9fc182d140b6fe94171b323c0da9248debd7ec7ffe661508d"
  version "0.9.1"
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
