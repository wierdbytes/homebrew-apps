# wierdrd: Wierdr's daemon on the Mac (https://github.com/wierdbytes/wierdr/blob/master/docs/wierdrd.md).
#   brew install wierdbytes/apps/wierdrd && brew services start wierdrd
# Written for each release by Wierdr's workflow (scripts/wierdrd-release.sh in wierdbytes/wierdr):
# changes here are overwritten.
class Wierdrd < Formula
  desc "Wierdr's daemon: Herdr's agents on your iPhone's Lock Screen"
  homepage "https://github.com/wierdbytes/wierdr"
  url "https://github.com/wierdbytes/wierdr/releases/download/wierdrd-v0.1.0/wierdrd-0.1.0-macos.tar.gz"
  version "0.1.0"
  sha256 "68ec01e186544ba18929d9fa4e7ffb210d4fe118bbc3a4cea4303903b97f3ed7"

  depends_on :macos
  on_macos do
    depends_on macos: :sequoia
  end

  def install
    # The binary finds its resource bundles beside it.
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"wierdrd"
  end

  def caveats
    <<~EOS
      Wierdr sets wierdrd up by itself when it connects to this Mac. By hand:
        brew services start wierdrd
      Without ~/.config/wierdr/push.json it pushes through Wierdr's relay.
    EOS
  end

  service do
    run [opt_libexec/"wierdrd", "run"]
    keep_alive true
    process_type :background
    log_path var/"log/wierdrd.log"
    error_log_path var/"log/wierdrd.log"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/wierdrd --version").strip
  end
end
