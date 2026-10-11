class Ba3 < Formula
  desc "Bayesian inference of recent migration rates using multilocus genotypes"
  homepage "https://github.com/brannala/BA3/"
  url "https://github.com/brannala/BA3/releases/download/v3.6.0/BA3-3.6.0.tar.gz"
  sha256 "574f08060a6c98f995411755f2f9b5f4545ef25e7ea55b6efaaec3034a4564f4"
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
