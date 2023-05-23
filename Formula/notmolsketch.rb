# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Notmolsketch < Formula
  desc ""
  homepage "https://molsketch.sourceforge.io/"
  url "https://github.com/hvennekate/Molsketch/archive/refs/tags/Fluorine_0.8.0.tar.gz"
  license ""
  head "https://github.com/hvennekate/Molsketch.git"

  depends_on "cmake" => :build
  depends_on "open-babel" 
  depends_on "qt5" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", "-S", ".", "-B", "build", "-DMSK_PREFIX=#{prefix}" *std_cmake_args
    system "cmake", "--build", "build"
    system "make", "install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test Molsketch`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
