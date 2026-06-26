class Elephc < Formula
  desc "PHP-to-native compiler targeting macOS ARM64"
  homepage "https://github.com/illegalstudio/elephc"
  url "https://github.com/illegalstudio/elephc/releases/download/v0.25.2/elephc-v0.25.2-aarch64-apple-darwin.tar.gz"
  sha256 "fdf2c1dc53ba1521c3b4133edb7e3c83bf235c70ca06355832e2f206d1791699"
  version "0.25.2"
  license "MIT"

  depends_on :macos
  depends_on :arch => :arm64

  def install
    bin.install "elephc"
    lib.install "libelephc_tls.a"
    lib.install "libelephc_pdo.a"
    lib.install "libelephc_crypto.a"
    lib.install "libelephc_phar.a"
    lib.install "libelephc_tz.a"
    lib.install "libelephc_image.a"
    lib.install "libelephc_web.a"
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

    # Exercise the timezone-database bridge (DateTimeZone introspection)
    # from the Homebrew lib/ layout; getLocation() reads libelephc_tz.a.
    (testpath/"tz.php").write('<?php echo (new DateTimeZone("Europe/Rome"))->getLocation()["country_code"];')
    system bin/"elephc", "tz.php"
    assert_equal "IT", shell_output("#{testpath}/tz")

    # Exercise the image bridge (GD) from the Homebrew lib/ layout;
    # validates that libelephc_image.a is discoverable and linked.
    (testpath/"img.php").write('<?php $im = imagecreatetruecolor(3, 2); echo imagesx($im) . "x" . imagesy($im);')
    system bin/"elephc", "img.php"
    assert_equal "3x2", shell_output("#{testpath}/img")

    # Exercise the web bridge link path from the Homebrew lib/ layout.
    (testpath/"web.php").write('<?php echo "web-ok";')
    system bin/"elephc", "--web", "web.php"
    assert_predicate testpath/"web", :exist?
  end
end
