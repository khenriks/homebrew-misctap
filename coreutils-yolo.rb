require 'formula'

# Formula to install symlinks for coreutils commands without g- prefix

class CoreutilsYolo < Formula
  class NoopDownloadStrategy < AbstractDownloadStrategy
    def fetch; end
    def stage; end
  end

  url '/', :using => NoopDownloadStrategy
  version '0.1'

  depends_on 'coreutils'

  def install
    (Formula.factory('coreutils').opt_prefix/'bin').children.each do |entry|
      next if entry.directory? or not entry.fnmatch?('*/g*')
      bin.install_symlink entry => entry.basename.to_s[1..-1]
    end

    (Formula.factory('coreutils').opt_prefix/'share/man/man1').children.each do |entry|
      next if entry.directory? or not entry.fnmatch?('*/g*')
      man1.install_symlink entry => entry.basename.to_s[1..-1]
    end
  end
end
