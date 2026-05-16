class Ba3 < Formula
  desc "Bayesian inference of recent migration rates using multilocus genotypes"
  homepage "https://github.com/brannala/BA3/"
  url "https://github.com/brannala/BA3/releases/download/v3.4.0/BA3-3.4.0.tar.gz"
  sha256 "69e01f326c26c0a2d7ec9c8a3680879e69997d958db693a62f5e03e1c316ebe7"
  license "AGPL-3.0-or-later"

  depends_on "gsl"
  depends_on "htslib"

  def install
    system "make"
    bin.install "BA3"
  end

  test do
    (testpath/"test.txt").write <<~EOS
      ind1 pop1 loc1 A A
      ind1 pop1 loc2 B B
      ind2 pop1 loc1 A A
      ind2 pop1 loc2 B B
      ind3 pop2 loc1 A A
      ind3 pop2 loc2 B B
      ind4 pop2 loc1 A A
      ind4 pop2 loc2 B B
    EOS
    system "#{bin}/BA3", "-i", "1000", "-o", "out.txt", "test.txt"
    assert_path_exists testpath/"out.txt"
  end
end
