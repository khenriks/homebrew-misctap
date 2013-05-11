require 'formula'

class Pylolz < Formula
  homepage 'https://code.google.com/p/pylolz/'
  url 'http://pylolz.googlecode.com/files/pylolz-0.3.tar.gz'
  sha1 '487fcf503cdf482d01450b915160ac737b56f5dc'

  def patches
    # Put translate database in share dir
    # Translate text from stdin
    DATA
  end

  def install
    bin.install('lolz.py' => 'lolz')
    (share/'pylolz').install('tranzlator.yml')
  end
end

__END__
--- a/lolz.py 2013-05-11 01:05:40.000000000 -0400
+++ b/lolz.py 2013-05-11 01:07:15.000000000 -0400
@@ -15,7 +15,7 @@

 import yaml, sys, os.path, re

-DEFAULT_LOLZ_DB = os.path.join(os.path.split(__file__)[0], 'tranzlator.yml')
+DEFAULT_LOLZ_DB = os.path.join(os.path.split(__file__)[0], '../share/pylolz/tranzlator.yml')

 class Tranzlator(object):
     """
@@ -126,4 +126,5 @@
             tranz = Tranzlator()
             print tranz.translate_sentence(' '.join(sys.argv[1:]))
     else:
-        print "Usage: %s text to tranzlate" % sys.argv[0]
+        tranz = Tranzlator()
+        print tranz.translate_sentence(sys.stdin.read())
