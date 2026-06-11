class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.9/elephc-v0.23.9-aarch64-apple-darwin.tar.gz"
  sha256 "09fef5db6d9f059cb0c69d52694c02bffd3a1bdfc8859d8bda23b33aa8ca5af3"
  version "0.23.9"
  license "MIT"

  depends_on :macos
  depends_on :arch => :arm64

  def install
    bin.install "elephc"
    lib.install "libelephc_tls.a"
    lib.install "libelephc_pdo.a"
  end

  test do
    (testpath/"hello.php").write('<?php echo "hello";')
    system bin/"elephc", "hello.php"
    assert_equal "hello", shell_output("#{testpath}/hello")

    # Exercise the TLS bridge (https wrapper).
    (testpath/"https.php").write('<?php  = fopen("https://example.com/", "r"); echo is_resource();')
    system bin/"elephc", "https.php"
    assert_predicate testpath/"https", :exist?

    # Exercise the PDO bridge (SQLite driver is bundled; no external
    # DB client or server required). This also validates that
    # libelephc_pdo.a is discoverable in the Homebrew  layout.
    (testpath/"pdo.php").write('<?php  = new PDO("sqlite::memory:"); ->exec("CREATE TABLE t(id INTEGER)"); echo "pdo-ok";')
    system bin/"elephc", "pdo.php"
    assert_equal "pdo-ok", shell_output("#{testpath}/pdo")
  end
end
