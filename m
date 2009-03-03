From: Oliver Falk <oliver@linux-kernel.at>
Subject: rpm 4.6.0 alpha ISA* fix
Date: Tue, 03 Mar 2009 10:15:03 +0100
Message-ID: <49ACF517.8090707@linux-kernel.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-alpha@vger.kernel.org

fyi.

diff -up rpm-4.6.0/installplatform.alpha rpm-4.6.0/installplatform
--- rpm-4.6.0/installplatform.alpha     2009-03-02 17:33:32.000000000 +0100
+++ rpm-4.6.0/installplatform   2009-03-02 17:33:56.000000000 +0100
@@ -74,6 +74,10 @@ for SUBST in $SUBSTS ; do
   ISANAME=
   ISABITS=
   case "${ARCH}" in
+    alpha*)
+       ISANAME=alpha
+       ISABITS=64
+       ;;
     sparc64*)
        ISANAME=sparc
        ISABITS=64

Just in case anybody else will play with rpm 4.6.x.

Please also note, that Panu already put this upstream!

-of

