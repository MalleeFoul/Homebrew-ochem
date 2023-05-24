# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Molsketch < Formula
  desc "Molsketch is a 2D molecular editing tool. Its goal is to help you draw molecules quick and easily."
  homepage "https://molsketch.sourceforge.io/"
  url "https://github.com/hvennekate/Molsketch/archive/refs/tags/Fluorine_0.8.0.tar.gz"
  sha256 "37c960de78e061c202bc8b0e882510b409b154cdd06d457353898ccdb8445f86"
  license "GPL-2.0"

  depends_on "cmake" => :build
  depends_on "open-babel"
  depends_on "qt@5" => :build

  def install

    ENV['MSK_PREFIX'] = "#{prefix}" # God, this is a bit of a pain
    ENV['MSK_INSTALL_BINS'] = "#{bin}" # Like why couldn't they have just had the variables relate to each other
    ENV['MSK_INSTALL_INCLUDES'] = "#{include}" # I'm sure they're nice people and all, and I rlly shouldn't badmouth them
    ENV['MSK_INSTALL_LIBS64'] = "#{lib}" # so, sorry about that, if you haven't noticed, my sanity is slowly degrading tbh.
    ENV['MSK_INSTALL_LIBS'] = "#{lib}"

    ENV['QT_CORE'] = "#{Formula["qt@5"].lib}/cmake/Qt5Core}"
    # ENV.deparallelize  # if your formula fails when building in parallel
    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "make", "install"
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
