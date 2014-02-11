require 'formula'

class PetscGood < Formula
  homepage 'http://www.mcs.anl.gov/petsc/index.html'
  url 'http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-lite-3.4.3.tar.gz'
  sha1 '8c5d97ba4a28ea8fa830e513a9dcbfd61b51beaf'
  head 'https://bitbucket.org/petsc/petsc', :using => :git

  option 'with-debug', "Compile with debugging enabled"

  depends_on :mpi => :cc
  depends_on :fortran
  depends_on :x11 => MacOS::X11.installed? ? :recommended : :optional
  depends_on 'cmake' => :build

  def install
    ENV.deparallelize

    args = ["--prefix=#{prefix}"]
    args << "--with-debugging=0" if build.without? 'debug'
    args << "--with-x=0" if build.without? 'x11'

    system "./configure", *args
    system "make all"
    system "make test"
    system "make install"
  end
end
