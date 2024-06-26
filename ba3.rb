# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Ba3 < Formula
  desc "BA3 (BayesAss) is a population genetic program for inferring recent migration rates"
  homepage "https://github.com/brannala/BA3/"
  url "https://github.com/brannala/BA3/archive/refs/tags/3.0.5.7.tar.gz"
  sha256 "ed0d03ce3f3708f386c0cf5e73f1d008cedf9c257467421a406e02c0d9692787"
  license "GPL3"

  depends_on "gsl"
  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    system "make all"
    bin.install "BA3SNP"
    bin.install "BA3MSAT"
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test ba3`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
