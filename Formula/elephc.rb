class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.20.2/elephc-v0.20.2-aarch64-apple-darwin.tar.gz"
  sha256 "668f987aab8040d875eec883782e7c288facb1e9f903deaffca99db1334a0b00"
  version "0.20.2"
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
