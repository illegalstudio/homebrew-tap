class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.23.13/elephc-v0.23.13-aarch64-apple-darwin.tar.gz"
  sha256 "72bbea98a0d5cf90339d2f91ac2045adc0b38f94b4dc4ebe324a003ebd7bc661"
  version "0.23.13"
  license "MIT"

  depends_on :macos
  depends_on :arch => :arm64

  def install
    bin.install "elephc"
    lib.install "libelephc_tls.a"
    lib.install "libelephc_pdo.a"
    lib.install "libelephc_crypto.a"
    lib.install "libelephc_phar.a"
  end

  test do
    (testpath/"hello.php").write('<?php echo "hello";')
    system bin/"elephc", "hello.php"
    assert_equal "hello", shell_output("#{testpath}/hello")

    # Exercise the TLS bridge (https wrapper).
    (testpath/"https.php").write('<?php $h = fopen("https://example.com/", "r"); echo is_resource($h);')
    system bin/"elephc", "https.php"
    assert_predicate testpath/"https", :exist?

    # Exercise the PDO bridge (SQLite driver is bundled; no external
    # DB client or server required). This also validates that
    # libelephc_pdo.a is discoverable in the Homebrew lib/ layout.
    (testpath/"pdo.php").write('<?php $db = new PDO("sqlite::memory:"); $db->exec("CREATE TABLE t(id INTEGER)"); echo "pdo-ok";')
    system bin/"elephc", "pdo.php"
    assert_equal "pdo-ok", shell_output("#{testpath}/pdo")

    # Exercise the crypto bridge used by hash()/hash_hmac().
    (testpath/"hash.php").write('<?php echo hash("sha256", "abc");')
    system bin/"elephc", "hash.php"
    assert_equal "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", shell_output("#{testpath}/hash")

    # Exercise the PHAR bridge from the Homebrew lib/ layout.
    (testpath/"phar.php").write('<?php file_put_contents("phar://brew.phar/entry.txt", "phar-ok"); $p = "brew.phar"; echo file_get_contents("phar://" . $p . "/entry.txt");')
    system bin/"elephc", "phar.php"
    assert_equal "phar-ok", shell_output("#{testpath}/phar")
  end
end
