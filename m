From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [Uclinux-dist-devel] Config Items appearing twice in same Kconfig
	file?
Date: Mon, 17 May 2010 01:13:23 -0400
Message-ID: <AANLkTinCRYpqKuJ8NM2sk2hvrgFiqvo9mvXLApun0myA@mail.gmail.com>
References: <20100512143445.GA32559@faui48a.informatik.uni-erlangen.de> 
	<20100512144017.GA722@faui48a.informatik.uni-erlangen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=O8W6yf9jQdmKFhSLcW4/Kfa08jF3J5k2hFLdP19J1F4=;
	b=ISx3I63ZhGiwoNLJ9ZqxgmbHZhIEdBPW/E0Mnf1B3sYSk6C2a2bWnXOEo+tpqHIpQl
	pz9yd4aHpAZnqnpWy9CB69jGFbtdIBcEbcTEgAF3k7qBYejQC/2tkKzgsd/FUCDoUk3a
	9WvA1krPYZfjo6uXGUSB7ZAUAhjNfMhVDGvqU=
In-Reply-To: <20100512144017.GA722@faui48a.informatik.uni-erlangen.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
	<mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Sender: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
To: Christoph Egger <siccegge@cs.fau.de>
Cc: linux-ia64@vger.kernel.org, vamos@i4.informatik.uni-erlangen.de, Jesse Barnes <jbarnes@virtuousgeek.org>, Timo Teras <timo.teras@iki.fi>, Chen Liqin <liqin.chen@sunplusct.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Lennox Wu <lennox.wu@gmail.com>, Jesper Nilsson <jesper.nilsson@axis.com>, "Pekka Savola (ipv6)" <pekkas@netcore.fi>, x86@kernel.org, James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.yu@intel.com>, Mike Frysinger <vapier@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, Graf Yang <graf.yang@analog.com>, Mikael Starvik <starvik@axis.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Thomas Gleixner <tglx@linutronix.de>, Arjan van de Ven <arjan@linux.intel.com>, Richard Henderson <rth@twiddle.net>, Karsten Keil <isdn@linux-pi>

T24gV2VkLCBNYXkgMTIsIDIwMTAgYXQgMTA6NDAsIENocmlzdG9waCBFZ2dlciB3cm90ZToKPiDC
oCDCoCDCoDIgYXJjaC9ibGFja2Zpbi9LY29uZmlnOmNvbmZpZyBNRU1fTVQ0OExDMzJNOEEyXzc1
Cgp0aGFua3MsIGknbGwgZ2V0IHRoaXMgc2ltcGxlIGJ1ZyBmaXhlZAotbWlrZQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eHBwYy1kZXYgbWFpbGlu
ZyBsaXN0CkxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCmh0dHBzOi8vbGlzdHMub3psYWJz
Lm9yZy9saXN0aW5mby9saW51eHBwYy1kZXY=
