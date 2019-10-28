class TincAT11pre17 < Formula
  desc "Virtual Private Network (VPN) tool"
  homepage "https://www.tinc-vpn.org/"
  url "http://tinc-vpn.org/packages/tinc-1.1pre17.tar.gz"
  sha256 "61b9c9f9f396768551f39216edcc41918c65909ffd9af071feb3b5f9f9ac1c27"

  keg_only :versioned_formula

  depends_on "lzo"
  depends_on "openssl@1.1"

  def install
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{etc}",
                          "--enable-jumbograms", "--enable-tunemu"
                          "--with-openssl=#{Formula["openssl@1.1"].opt_prefix}"
    system "make", "install"
  end

  test do
    assert_match version.to_s, shell_output("#{sbin}/tincd --version")
  end
end
