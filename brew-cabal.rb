require 'formula'

class BrewCabal < Formula
  homepage ''
  url 'https://raw.github.com/khenriks/homebrew-misctap/bin/brew-cabal', :using => :nounzip
  sha1 'f9f5352e57745710604a7e5063beaa9d5d5438c5'
  version '0.1'

  depends_on 'haskell-platform'

  def install
    bin.install 'brew-cabal'
  end
end
