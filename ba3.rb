class Ba3 < Formula
  desc "Bayesian inference of recent migration rates using multilocus genotypes"
  homepage "https://github.com/brannala/BA3/"
  url "https://github.com/brannala/BA3/releases/download/v3.7.2/BA3-3.7.2.tar.gz"
  sha256 "f9433bf5a6f35c68a5637e2c63af2e5167226535eeeaf6f43e4144f2c497cc2a"
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
