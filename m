From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Subject: [PATCH] alpha: Kconfig: Replace HTTP links with HTTPS ones
Date: Mon, 13 Jul 2020 11:43:41 +0200
Message-ID: <20200713094341.32930-1-grandmaster@al2klimov.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, masahiroy@kernel.org, info@metux.net, geert@linux-m68k.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>

Rationale:
Reduces attack surface on kernel devs opening the links for MITM
as HTTPS traffic is much harder to manipulate.

Deterministic algorithm:
For each file:
  If not .svg:
    For each line:
      If doesn't contain `\bxmlns\b`:
        For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
            If both the HTTP and HTTPS versions
            return 200 OK and serve the same content:
              Replace HTTP with HTTPS.

Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
---
 Continuing my work started at 93431e0607e5.
 See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
 (Actually letting a shell for loop submit all this stuff for me.)

 If there are any URLs to be removed completely or at least not just HTTPSified:
 Just clearly say so and I'll *undo my change*.
 See also: https://lkml.org/lkml/2020/6/27/64

 If there are any valid, but yet not changed URLs:
 See: https://lkml.org/lkml/2020/6/26/837

 If you apply the patch, please let me know.

 Sorry again to all maintainers who complained about subject lines.
 Now I realized that you want an actually perfect prefixes,
 not just subsystem ones.
 I tried my best...
 And yes, *I could* (at least half-)automate it.
 Impossible is nothing! :)


 arch/alpha/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 10862c5a8c76..5cb1c9c6e3a8 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -533,7 +533,7 @@ config SMP
 	  will run faster if you say N here.
 
 	  See also the SMP-HOWTO available at
-	  <http://www.tldp.org/docs.html#howto>.
+	  <https://www.tldp.org/docs.html#howto>.
 
 	  If you don't know what to do here, say N.
 
-- 
2.27.0

