# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Molsketch < Formula
  desc "Molsketch is a 2D molecular editing tool. Its goal is to help you draw molecules quick and easily."
  homepage "https://molsketch.sourceforge.io/"
  url "https://sourceforge.net/projects/molsketch/files/latest/download"
  version "0.8.0"
  sha256 "329c787c792dc6a040926770aa0da95ef120bef19440f6e0ab12b05ca8e126e4"
  license "GPLv2"

  depends_on "cmake" => :build
  depends_on "open-babel"
  depends_on "qt5" => :build
  depends_on "pkg-config" => :build
  depends_on "creduce"

  def install

    args = [
      "-DMSK_PREFIX=#{prefix}",
    ]
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
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