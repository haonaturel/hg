  $ echo "[extensions]" >> $HGRCPATH
  $ echo "patchbomb=" >> $HGRCPATH

  $ hg init t
  $ cd t
  $ echo a > a
  $ hg commit -Ama -d '1 0'
  adding a

  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -r tip
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  

  $ hg --config ui.interactive=1 email --confirm -n -f quux -t foo -c bar -r tip<<EOF
  > n
  > EOF
  This patch series consists of 1 patches.
  
  
  Final summary:
  
  From: quux
  To: foo
  Cc: bar
  Subject: [PATCH] a
   a |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  are you sure you want to send (yn)? abort: patchbomb canceled
  [255]

  $ echo b > b
  $ hg commit -Amb -d '2 0'
  adding b

  $ hg email --date '1970-1-1 0:2' -n -f quux -t foo -c bar -s test -r 0:tip
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2] test
  Message-Id: <patchbomb.120@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:02:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.121@*> (glob)
  In-Reply-To: <patchbomb.120@*> (glob)
  References: <patchbomb.120@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:02:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.122@*> (glob)
  In-Reply-To: <patchbomb.120@*> (glob)
  References: <patchbomb.120@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:02:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

.hg/last-email.txt

  $ cat > editor.sh << '__EOF__'
  > echo "a precious introductory message" > "$1"
  > __EOF__
  $ HGEDITOR="\"sh\" \"`pwd`/editor.sh\"" hg email -n -t foo -s test -r 0:tip > /dev/null
  $ cat .hg/last-email.txt
  a precious introductory message

  $ hg email -m test.mbox -f quux -t foo -c bar -s test 0:tip \
  > --config extensions.progress= --config progress.assume-tty=1 \
  > --config progress.delay=0 --config progress.refresh=0 \
  > --config progress.width=60 2>&1 | \
  > python "$TESTDIR/filtercr.py"
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  sending [                                             ] 0/3
  sending [                                             ] 0/3
                                                              
                                                              
  sending [==============>                              ] 1/3
  sending [==============>                              ] 1/3
                                                              
                                                              
  sending [=============================>               ] 2/3
  sending [=============================>               ] 2/3
                                                              \r (esc)
  Sending [PATCH 0 of 2] test ...
  Sending [PATCH 1 of 2] a ...
  Sending [PATCH 2 of 2] b ...
  

  $ cd ..

  $ hg clone -q t t2
  $ cd t2
  $ echo c > c
  $ hg commit -Amc -d '3 0'
  adding c

  $ cat > description <<EOF
  > a multiline
  > 
  > description
  > EOF


test bundle and description:
  $ hg email --date '1970-1-1 0:3' -n -f quux -t foo \
  >  -c bar -s test -r tip -b --desc description
  searching for changes
  1 changesets found
  
  Displaying test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: test
  Message-Id: <patchbomb.180@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:03:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  a multiline
  
  description
  
  --===* (glob)
  Content-Type: application/x-mercurial-bundle
  MIME-Version: 1.0
  Content-Disposition: attachment; filename="bundle.hg"
  Content-Transfer-Encoding: base64
  
  SEcxMEJaaDkxQVkmU1nvR7I3AAAN////lFYQWj1/4HwRkdC/AywIAk0E4pfoSIIIgQCgGEQOcLAA
  2tA1VPyp4mkeoG0EaaPU0GTT1GjRiNPIg9CZGBqZ6UbU9J+KFU09DNUaGgAAAAAANAGgAAAAA1U8
  oGgAADQGgAANNANAAAAAAZipFLz3XoakCEQB3PVPyHJVi1iYkAAKQAZQGpQGZESInRnCFMqLDla2
  Bx3qfRQeA2N4lnzKkAmP8kR2asievLLXXebVU8Vg4iEBqcJNJAxIapSU6SM4888ZAciRG6MYAIEE
  SlIBpFisgGkyRjX//TMtfcUAEsGu56+YnE1OlTZmzKm8BSu2rvo4rHAYYaadIFFuTy0LYgIkgLVD
  sgVa2F19D1tx9+hgbAygLgQwaIqcDdgA4BjQgIiz/AEP72++llgDKhKducqodGE4B0ETqF3JFOFC
  Q70eyNw=
  --===*-- (glob)

utf-8 patch:
  $ python -c 'fp = open("utf", "wb"); fp.write("h\xC3\xB6mma!\n"); fp.close();'
  $ hg commit -A -d '4 0' -m 'utf-8 content'
  adding description
  adding utf

no mime encoding for email --test:
  $ hg email --date '1970-1-1 0:4' -f quux -t foo -c bar -r tip -n
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] utf-8 content ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 8bit
  Subject: [PATCH] utf-8 content
  X-Mercurial-Node: 909a00e13e9d78b575aeee23dddbada46d5a143f
  Message-Id: <909a00e13e9d78b575ae.240@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:04:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID 909a00e13e9d78b575aeee23dddbada46d5a143f
  # Parent  ff2c9fa2018b15fa74b33363bda9527323e2a99f
  utf-8 content
  
  diff -r ff2c9fa2018b -r 909a00e13e9d description
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/description	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,3 @@
  +a multiline
  +
  +description
  diff -r ff2c9fa2018b -r 909a00e13e9d utf
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/utf	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,1 @@
  +h\xc3\xb6mma! (esc)
  

mime encoded mbox (base64):
  $ hg email --date '1970-1-1 0:4' -f 'Q <quux>' -t foo -c bar -r tip -m mbox
  This patch series consists of 1 patches.
  
  
  Sending [PATCH] utf-8 content ...

  $ cat mbox
  From quux ... ... .. ..:..:.. .... (re)
  Content-Type: text/plain; charset="utf-8"
  MIME-Version: 1.0
  Content-Transfer-Encoding: base64
  Subject: [PATCH] utf-8 content
  X-Mercurial-Node: 909a00e13e9d78b575aeee23dddbada46d5a143f
  Message-Id: <909a00e13e9d78b575ae.240@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:04:00 +0000
  From: Q <quux>
  To: foo
  Cc: bar
  
  IyBIRyBjaGFuZ2VzZXQgcGF0Y2gKIyBVc2VyIHRlc3QKIyBEYXRlIDQgMAojIE5vZGUgSUQgOTA5
  YTAwZTEzZTlkNzhiNTc1YWVlZTIzZGRkYmFkYTQ2ZDVhMTQzZgojIFBhcmVudCAgZmYyYzlmYTIw
  MThiMTVmYTc0YjMzMzYzYmRhOTUyNzMyM2UyYTk5Zgp1dGYtOCBjb250ZW50CgpkaWZmIC1yIGZm
  MmM5ZmEyMDE4YiAtciA5MDlhMDBlMTNlOWQgZGVzY3JpcHRpb24KLS0tIC9kZXYvbnVsbAlUaHUg
  SmFuIDAxIDAwOjAwOjAwIDE5NzAgKzAwMDAKKysrIGIvZGVzY3JpcHRpb24JVGh1IEphbiAwMSAw
  MDowMDowNCAxOTcwICswMDAwCkBAIC0wLDAgKzEsMyBAQAorYSBtdWx0aWxpbmUKKworZGVzY3Jp
  cHRpb24KZGlmZiAtciBmZjJjOWZhMjAxOGIgLXIgOTA5YTAwZTEzZTlkIHV0ZgotLS0gL2Rldi9u
  dWxsCVRodSBKYW4gMDEgMDA6MDA6MDAgMTk3MCArMDAwMAorKysgYi91dGYJVGh1IEphbiAwMSAw
  MDowMDowNCAxOTcwICswMDAwCkBAIC0wLDAgKzEsMSBAQAoraMO2bW1hIQo=
  
  
  $ python -c 'print open("mbox").read().split("\n\n")[1].decode("base64")'
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID 909a00e13e9d78b575aeee23dddbada46d5a143f
  # Parent  ff2c9fa2018b15fa74b33363bda9527323e2a99f
  utf-8 content
  
  diff -r ff2c9fa2018b -r 909a00e13e9d description
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/description	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,3 @@
  +a multiline
  +
  +description
  diff -r ff2c9fa2018b -r 909a00e13e9d utf
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/utf	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,1 @@
  +h\xc3\xb6mma! (esc)
  
  $ rm mbox

mime encoded mbox (quoted-printable):
  $ python -c 'fp = open("long", "wb"); fp.write("%s\nfoo\n\nbar\n" % ("x" * 1024)); fp.close();'
  $ hg commit -A -d '4 0' -m 'long line'
  adding long

no mime encoding for email --test:
  $ hg email --date '1970-1-1 0:4' -f quux -t foo -c bar -r tip -n
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] long line ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Subject: [PATCH] long line
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.240@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:04:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  

mime encoded mbox (quoted-printable):
  $ hg email --date '1970-1-1 0:4' -f quux -t foo -c bar -r tip -m mbox
  This patch series consists of 1 patches.
  
  
  Sending [PATCH] long line ...
  $ cat mbox
  From quux ... ... .. ..:..:.. .... (re)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Subject: [PATCH] long line
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.240@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:04:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  

  $ rm mbox

iso-8859-1 patch:
  $ python -c 'fp = open("isolatin", "wb"); fp.write("h\xF6mma!\n"); fp.close();'
  $ hg commit -A -d '5 0' -m 'isolatin 8-bit encoding'
  adding isolatin

fake ascii mbox:
  $ hg email --date '1970-1-1 0:5' -f quux -t foo -c bar -r tip -m mbox
  This patch series consists of 1 patches.
  
  
  Sending [PATCH] isolatin 8-bit encoding ...
  $ cat mbox
  From quux ... ... .. ..:..:.. .... (re)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 8bit
  Subject: [PATCH] isolatin 8-bit encoding
  X-Mercurial-Node: 240fb913fc1b7ff15ddb9f33e73d82bf5277c720
  Message-Id: <240fb913fc1b7ff15ddb.300@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:05:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 5 0
  # Node ID 240fb913fc1b7ff15ddb9f33e73d82bf5277c720
  # Parent  a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  isolatin 8-bit encoding
  
  diff -r a2ea8fc83dd8 -r 240fb913fc1b isolatin
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/isolatin	Thu Jan 01 00:00:05 1970 +0000
  @@ -0,0 +1,1 @@
  +h\xf6mma! (esc)
  
  

test diffstat for single patch:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -d -y -r 2
  This patch series consists of 1 patches.
  
  
  Final summary:
  
  From: quux
  To: foo
  Cc: bar
  Subject: [PATCH] test
   c |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  are you sure you want to send (yn)? y
  
  Displaying [PATCH] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
   c |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test diffstat for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -d -y \
  >  -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Final summary:
  
  From: quux
  To: foo
  Cc: bar
  Subject: [PATCH 0 of 2] test
   a |  1 +
   b |  1 +
   2 files changed, 2 insertions(+), 0 deletions(-)
  Subject: [PATCH 1 of 2] a
   a |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  Subject: [PATCH 2 of 2] b
   b |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  are you sure you want to send (yn)? y
  
  Displaying [PATCH 0 of 2] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
   a |  1 +
   b |  1 +
   2 files changed, 2 insertions(+), 0 deletions(-)
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
   a |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
   b |  1 +
   1 files changed, 1 insertions(+), 0 deletions(-)
  
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

test inline for single patch:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -i -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=t2.patch
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  --===*-- (glob)


test inline for single patch (quoted-printable):
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -i -r 4
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Content-Disposition: inline; filename=t2.patch
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  --===*-- (glob)

test inline for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -i \
  >  -r 0:1 -r 4
  This patch series consists of 3 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 3] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 3] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 3] a ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 1 of 3] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=t2-1.patch
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  --===*-- (glob)
  Displaying [PATCH 2 of 3] b ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 2 of 3] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=t2-2.patch
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  
  --===*-- (glob)
  Displaying [PATCH 3 of 3] long line ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 3 of 3] long line
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.63@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:03 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Content-Disposition: inline; filename=t2-3.patch
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  --===*-- (glob)

test attach for single patch:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -a -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  Patch subject is complete summary.
  
  
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: attachment; filename=t2.patch
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  --===*-- (glob)

test attach for single patch (quoted-printable):
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -a -r 4
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  Patch subject is complete summary.
  
  
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Content-Disposition: attachment; filename=t2.patch
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  --===*-- (glob)

test attach and body for single patch:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -a --body -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: attachment; filename=t2.patch
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  --===*-- (glob)

test attach for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -a \
  >  -r 0:1 -r 4
  This patch series consists of 3 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 3] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 3] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 3] a ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 1 of 3] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  Patch subject is complete summary.
  
  
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: attachment; filename=t2-1.patch
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  --===*-- (glob)
  Displaying [PATCH 2 of 3] b ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 2 of 3] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  Patch subject is complete summary.
  
  
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: attachment; filename=t2-2.patch
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  
  --===*-- (glob)
  Displaying [PATCH 3 of 3] long line ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 3 of 3] long line
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.63@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:03 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  
  Patch subject is complete summary.
  
  
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Content-Disposition: attachment; filename=t2-3.patch
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  --===*-- (glob)

test intro for single patch:
  $ hg email --date '1970-1-1 0:1' -n --intro -f quux -t foo -c bar -s test \
  >  -r 2
  This patch series consists of 1 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 1] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 1] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 1] c ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 1] c
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test --desc without --intro for a single patch:
  $ echo foo > intro.text
  $ hg email --date '1970-1-1 0:1' -n --desc intro.text -f quux -t foo -c bar \
  >  -s test -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH 0 of 1] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 1] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  foo
  
  Displaying [PATCH 1 of 1] c ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 1] c
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test intro for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n --intro -f quux -t foo -c bar -s test \
  >  -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

test reply-to via config:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -r 2 \
  >  --config patchbomb.reply-to='baz@example.com'
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  Reply-To: baz@example.com
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test reply-to via command line:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -r 2 \
  >  --reply-to baz --reply-to fred
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  Reply-To: baz, fred
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

tagging csets:
  $ hg tag -r0 zero zero.foo
  $ hg tag -r1 one one.patch
  $ hg tag -r2 two two.diff

test inline for single named patch:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -i -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] test ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=two.diff
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  --===*-- (glob)

test inline for multiple named/unnamed patches:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar -s test -i -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=t2-1.patch
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  --===*-- (glob)
  Displaying [PATCH 2 of 2] b ...
  Content-Type: multipart/mixed; boundary="===*" (glob)
  MIME-Version: 1.0
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  --===* (glob)
  Content-Type: text/x-patch; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Content-Disposition: inline; filename=one.patch
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  
  --===*-- (glob)


test inreplyto:
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar --in-reply-to baz \
  >  -r tip
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH] Added tag two, two.diff for changeset ff2c9fa2018b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] Added tag two, two.diff for changeset ff2c9fa2018b
  X-Mercurial-Node: 7aead2484924c445ad8ce2613df91f52f9e502ed
  Message-Id: <7aead2484924c445ad8c.60@*> (glob)
  In-Reply-To: <baz>
  References: <baz>
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 0 0
  # Node ID 7aead2484924c445ad8ce2613df91f52f9e502ed
  # Parent  045ca29b1ea20e4940411e695e20e521f2f0f98e
  Added tag two, two.diff for changeset ff2c9fa2018b
  
  diff -r 045ca29b1ea2 -r 7aead2484924 .hgtags
  --- a/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  +++ b/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  @@ -2,3 +2,5 @@
   8580ff50825a50c8f716709acdf8de0deddcd6ab zero.foo
   97d72e5f12c7e84f85064aa72e5a297142c36ed9 one
   97d72e5f12c7e84f85064aa72e5a297142c36ed9 one.patch
  +ff2c9fa2018b15fa74b33363bda9527323e2a99f two
  +ff2c9fa2018b15fa74b33363bda9527323e2a99f two.diff
  
no intro message in non-interactive mode
  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar --in-reply-to baz \
  >  -r 0:1
  This patch series consists of 2 patches.
  
  (optional) Subject: [PATCH 0 of 2] 
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.60@*> (glob)
  In-Reply-To: <baz>
  References: <baz>
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.61@*> (glob)
  In-Reply-To: <8580ff50825a50c8f716.60@*> (glob)
  References: <8580ff50825a50c8f716.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  



  $ hg email --date '1970-1-1 0:1' -n -f quux -t foo -c bar --in-reply-to baz \
  >  -s test -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2] test
  Message-Id: <patchbomb.60@*> (glob)
  In-Reply-To: <baz>
  References: <baz>
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

test single flag for single patch:
  $ hg email --date '1970-1-1 0:1' -n --flag fooFlag -f quux -t foo -c bar -s test \
  >  -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH fooFlag] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH fooFlag] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test single flag for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n --flag fooFlag -f quux -t foo -c bar -s test \
  >  -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2 fooFlag] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2 fooFlag] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2 fooFlag] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2 fooFlag] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2 fooFlag] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2 fooFlag] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

test mutiple flags for single patch:
  $ hg email --date '1970-1-1 0:1' -n --flag fooFlag --flag barFlag -f quux -t foo \
  >  -c bar -s test -r 2
  This patch series consists of 1 patches.
  
  
  Displaying [PATCH fooFlag barFlag] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH fooFlag barFlag] test
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  

test multiple flags for multiple patches:
  $ hg email --date '1970-1-1 0:1' -n --flag fooFlag --flag barFlag -f quux -t foo \
  >  -c bar -s test -r 0:1
  This patch series consists of 2 patches.
  
  
  Write the introductory message for the patch series.
  
  
  Displaying [PATCH 0 of 2 fooFlag barFlag] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 2 fooFlag barFlag] test
  Message-Id: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:00 +0000
  From: quux
  To: foo
  Cc: bar
  
  
  Displaying [PATCH 1 of 2 fooFlag barFlag] a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 2 fooFlag barFlag] a
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.61@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:01 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  Displaying [PATCH 2 of 2 fooFlag barFlag] b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 2 of 2 fooFlag barFlag] b
  X-Mercurial-Node: 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  Message-Id: <97d72e5f12c7e84f8506.62@*> (glob)
  In-Reply-To: <patchbomb.60@*> (glob)
  References: <patchbomb.60@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Thu, 01 Jan 1970 00:01:02 +0000
  From: quux
  To: foo
  Cc: bar
  
  # HG changeset patch
  # User test
  # Date 2 0
  # Node ID 97d72e5f12c7e84f85064aa72e5a297142c36ed9
  # Parent  8580ff50825a50c8f716709acdf8de0deddcd6ab
  b
  
  diff -r 8580ff50825a -r 97d72e5f12c7 b
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/b	Thu Jan 01 00:00:02 1970 +0000
  @@ -0,0 +1,1 @@
  +b
  

test multi-address parsing:
  $ hg email --date '1980-1-1 0:1' -m tmp.mbox -f quux -t 'spam<spam><eggs>' \
  >  -t toast -c 'foo,bar@example.com' -c '"A, B <>" <a@example.com>' -s test -r 0 \
  >  --config email.bcc='"Quux, A." <quux>'
  This patch series consists of 1 patches.
  
  
  Sending [PATCH] test ...
  $ cat < tmp.mbox
  From quux ... ... .. ..:..:.. .... (re)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:00 +0000
  From: quux
  To: spam <spam>, eggs, toast
  Cc: foo, bar@example.com, "A, B <>" <a@example.com>
  Bcc: "Quux, A." <quux>
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  

test multi-byte domain parsing:
  $ UUML=`python -c 'import sys; sys.stdout.write("\374")'`
  $ HGENCODING=iso-8859-1
  $ export HGENCODING
  $ hg email --date '1980-1-1 0:1' -m tmp.mbox -f quux -t "bar@${UUML}nicode.com" -s test -r 0
  This patch series consists of 1 patches.
  
  Cc: 
  
  Sending [PATCH] test ...

  $ cat tmp.mbox
  From quux ... ... .. ..:..:.. .... (re)
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: 8580ff50825a50c8f716709acdf8de0deddcd6ab
  Message-Id: <8580ff50825a50c8f716.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:00 +0000
  From: quux
  To: bar@xn--nicode-2ya.com
  
  # HG changeset patch
  # User test
  # Date 1 0
  # Node ID 8580ff50825a50c8f716709acdf8de0deddcd6ab
  # Parent  0000000000000000000000000000000000000000
  a
  
  diff -r 000000000000 -r 8580ff50825a a
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/a	Thu Jan 01 00:00:01 1970 +0000
  @@ -0,0 +1,1 @@
  +a
  
  

test outgoing:
  $ hg up 1
  0 files updated, 0 files merged, 6 files removed, 0 files unresolved

  $ hg branch test
  marked working directory as branch test
  (branches are permanent and global, did you want a bookmark?)

  $ echo d > d
  $ hg add d
  $ hg ci -md -d '4 0'
  $ hg email --date '1980-1-1 0:1' -n -t foo -s test -o ../t
  comparing with ../t
  searching for changes
  From [test]: test
  This patch series consists of 8 patches.
  
  
  Write the introductory message for the patch series.
  
  Cc: 
  
  Displaying [PATCH 0 of 8] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 0 of 8] test
  Message-Id: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:00 +0000
  From: test
  To: foo
  
  
  Displaying [PATCH 1 of 8] c ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 1 of 8] c
  X-Mercurial-Node: ff2c9fa2018b15fa74b33363bda9527323e2a99f
  Message-Id: <ff2c9fa2018b15fa74b3.315532861@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:01 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 3 0
  # Node ID ff2c9fa2018b15fa74b33363bda9527323e2a99f
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  c
  
  diff -r 97d72e5f12c7 -r ff2c9fa2018b c
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/c	Thu Jan 01 00:00:03 1970 +0000
  @@ -0,0 +1,1 @@
  +c
  
  Displaying [PATCH 2 of 8] utf-8 content ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 8bit
  Subject: [PATCH 2 of 8] utf-8 content
  X-Mercurial-Node: 909a00e13e9d78b575aeee23dddbada46d5a143f
  Message-Id: <909a00e13e9d78b575ae.315532862@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:02 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID 909a00e13e9d78b575aeee23dddbada46d5a143f
  # Parent  ff2c9fa2018b15fa74b33363bda9527323e2a99f
  utf-8 content
  
  diff -r ff2c9fa2018b -r 909a00e13e9d description
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/description	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,3 @@
  +a multiline
  +
  +description
  diff -r ff2c9fa2018b -r 909a00e13e9d utf
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/utf	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,1 @@
  +h\xc3\xb6mma! (esc)
  
  Displaying [PATCH 3 of 8] long line ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: quoted-printable
  Subject: [PATCH 3 of 8] long line
  X-Mercurial-Node: a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  Message-Id: <a2ea8fc83dd8b93cfd86.315532863@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:03 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Node ID a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  # Parent  909a00e13e9d78b575aeee23dddbada46d5a143f
  long line
  
  diff -r 909a00e13e9d -r a2ea8fc83dd8 long
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/long	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,4 @@
  +xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  +foo
  +
  +bar
  
  Displaying [PATCH 4 of 8] isolatin 8-bit encoding ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 8bit
  Subject: [PATCH 4 of 8] isolatin 8-bit encoding
  X-Mercurial-Node: 240fb913fc1b7ff15ddb9f33e73d82bf5277c720
  Message-Id: <240fb913fc1b7ff15ddb.315532864@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:04 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 5 0
  # Node ID 240fb913fc1b7ff15ddb9f33e73d82bf5277c720
  # Parent  a2ea8fc83dd8b93cfd86ac97b28287204ab806e1
  isolatin 8-bit encoding
  
  diff -r a2ea8fc83dd8 -r 240fb913fc1b isolatin
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/isolatin	Thu Jan 01 00:00:05 1970 +0000
  @@ -0,0 +1,1 @@
  +h\xf6mma! (esc)
  
  Displaying [PATCH 5 of 8] Added tag zero, zero.foo for changeset 8580ff50825a ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 5 of 8] Added tag zero, zero.foo for changeset 8580ff50825a
  X-Mercurial-Node: 5d5ef15dfe5e7bd3a4ee154b5fff76c7945ec433
  Message-Id: <5d5ef15dfe5e7bd3a4ee.315532865@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:05 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 0 0
  # Node ID 5d5ef15dfe5e7bd3a4ee154b5fff76c7945ec433
  # Parent  240fb913fc1b7ff15ddb9f33e73d82bf5277c720
  Added tag zero, zero.foo for changeset 8580ff50825a
  
  diff -r 240fb913fc1b -r 5d5ef15dfe5e .hgtags
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  @@ -0,0 +1,2 @@
  +8580ff50825a50c8f716709acdf8de0deddcd6ab zero
  +8580ff50825a50c8f716709acdf8de0deddcd6ab zero.foo
  
  Displaying [PATCH 6 of 8] Added tag one, one.patch for changeset 97d72e5f12c7 ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 6 of 8] Added tag one, one.patch for changeset 97d72e5f12c7
  X-Mercurial-Node: 045ca29b1ea20e4940411e695e20e521f2f0f98e
  Message-Id: <045ca29b1ea20e494041.315532866@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:06 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 0 0
  # Node ID 045ca29b1ea20e4940411e695e20e521f2f0f98e
  # Parent  5d5ef15dfe5e7bd3a4ee154b5fff76c7945ec433
  Added tag one, one.patch for changeset 97d72e5f12c7
  
  diff -r 5d5ef15dfe5e -r 045ca29b1ea2 .hgtags
  --- a/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  +++ b/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  @@ -1,2 +1,4 @@
   8580ff50825a50c8f716709acdf8de0deddcd6ab zero
   8580ff50825a50c8f716709acdf8de0deddcd6ab zero.foo
  +97d72e5f12c7e84f85064aa72e5a297142c36ed9 one
  +97d72e5f12c7e84f85064aa72e5a297142c36ed9 one.patch
  
  Displaying [PATCH 7 of 8] Added tag two, two.diff for changeset ff2c9fa2018b ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 7 of 8] Added tag two, two.diff for changeset ff2c9fa2018b
  X-Mercurial-Node: 7aead2484924c445ad8ce2613df91f52f9e502ed
  Message-Id: <7aead2484924c445ad8c.315532867@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:07 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 0 0
  # Node ID 7aead2484924c445ad8ce2613df91f52f9e502ed
  # Parent  045ca29b1ea20e4940411e695e20e521f2f0f98e
  Added tag two, two.diff for changeset ff2c9fa2018b
  
  diff -r 045ca29b1ea2 -r 7aead2484924 .hgtags
  --- a/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  +++ b/.hgtags	Thu Jan 01 00:00:00 1970 +0000
  @@ -2,3 +2,5 @@
   8580ff50825a50c8f716709acdf8de0deddcd6ab zero.foo
   97d72e5f12c7e84f85064aa72e5a297142c36ed9 one
   97d72e5f12c7e84f85064aa72e5a297142c36ed9 one.patch
  +ff2c9fa2018b15fa74b33363bda9527323e2a99f two
  +ff2c9fa2018b15fa74b33363bda9527323e2a99f two.diff
  
  Displaying [PATCH 8 of 8] d ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH 8 of 8] d
  X-Mercurial-Node: 2f9fa9b998c5fe3ac2bd9a2b14bfcbeecbc7c268
  Message-Id: <2f9fa9b998c5fe3ac2bd.315532868@*> (glob)
  In-Reply-To: <patchbomb.315532860@*> (glob)
  References: <patchbomb.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:08 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Branch test
  # Node ID 2f9fa9b998c5fe3ac2bd9a2b14bfcbeecbc7c268
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  d
  
  diff -r 97d72e5f12c7 -r 2f9fa9b998c5 d
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/d	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,1 @@
  +d
  

dest#branch URIs:
  $ hg email --date '1980-1-1 0:1' -n -t foo -s test -o ../t#test
  comparing with ../t
  searching for changes
  From [test]: test
  This patch series consists of 1 patches.
  
  Cc: 
  
  Displaying [PATCH] test ...
  Content-Type: text/plain; charset="us-ascii"
  MIME-Version: 1.0
  Content-Transfer-Encoding: 7bit
  Subject: [PATCH] test
  X-Mercurial-Node: 2f9fa9b998c5fe3ac2bd9a2b14bfcbeecbc7c268
  Message-Id: <2f9fa9b998c5fe3ac2bd.315532860@*> (glob)
  User-Agent: Mercurial-patchbomb/* (glob)
  Date: Tue, 01 Jan 1980 00:01:00 +0000
  From: test
  To: foo
  
  # HG changeset patch
  # User test
  # Date 4 0
  # Branch test
  # Node ID 2f9fa9b998c5fe3ac2bd9a2b14bfcbeecbc7c268
  # Parent  97d72e5f12c7e84f85064aa72e5a297142c36ed9
  d
  
  diff -r 97d72e5f12c7 -r 2f9fa9b998c5 d
  --- /dev/null	Thu Jan 01 00:00:00 1970 +0000
  +++ b/d	Thu Jan 01 00:00:04 1970 +0000
  @@ -0,0 +1,1 @@
  +d
  
