From: "Arnd Bergmann" <arnd@arndb.de>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
Date: Thu, 11 May 2023 09:04:36 +0200
Message-ID: <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
References: <20230510195806.2902878-1-nphamcs@gmail.com>
Mime-Version: 1.0
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683788699; x=1683795899; bh=jq
	n9+i6S4uqktD4A+W4DhCnytpnr+GsOBOt4qhEN0dg=; b=VWXFys/0BV6m5RpZl2
	THPKXeF4YwHBhmXGHtHdIdnvjgDSIkVaQiJODFgiAPc6l5ALQz6E1fsfw32O/PsQ
	Bjk+gtazbYhFvNTmKslA+aFPzOW+HvaQwWgGV7Na81W2yU1L9NnA2fg3WeMXz5GE
	seZASc3hhKXbYSxv6BT00t4r5/jFufhxtUqnoyoM5fYQyu+iVj8XHbFVJX64byjq
	X8M78d5TZi4FoEjvjWM2+Yjxc5p1KvKkvnFT5I+nby5e/OvMn0j3dy5hHF6jwP1B
	WL9/ZS/4j9Evjonx35W4rZQP3CZS0VRTQE9LK5pSVKPmpajZqYawAxnBGYZJcaow
	rlyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683788699; x=1683795899; bh=jqn9+i6S4uqkt
	D4A+W4DhCnytpnr+GsOBOt4qhEN0dg=; b=WQV9C5RAcekZyjyo8xQuUDMSKPBcY
	lnbfOsB99ZwjDrX/avO6/64hJ07wRRy8asTMoAKht5Urd8CwUSv01sBXRoYk1YkO
	hJ9L5X9LWOshcTwUqt1dAKQGXHQ/VIUZaBvXt4uYksyjKQhGEL1UnmoQYxwNZTXE
	AcpPd+6kgB+AsxEpB3TMneh9RB90w1AwzVNkf4uNd+/sn/PKZus8T8lb55Cba6iX
	v0pISulFuCDCHfbzIbQAd7FrOIOh2QwFWiSbA6qGO84EVcbXRHj5m3P5yvClkjOw
	jsNeUuXoCisohtsWIuNct7oH+Ek6wgaiB9J4sCYoLQH1FK2GhWVigTe6g==
In-Reply-To: <20230510195806.2902878-1-nphamcs@gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane-mx.org@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nhat Pham <nphamcs@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, kernel-team@meta.com, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshay sky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-ar

On Wed, May 10, 2023, at 21:58, Nhat Pham wrote:
> cachestat is previously only wired in for x86 (and architectures using
> the generic unistd.h table):
>
> https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com/
>
> This patch wires cachestat in for all the other architectures.
>
> Signed-off-by: Nhat Pham <nphamcs@gmail.com>

The changes you did here look good, but you missed one
file that has never been converted to the syscall.tbl format:
arch/arm64/include/asm/unistd32.h along with the __NR_compat_syscalls
definition in arch/arm64/include/asm/unistd.h, please add those
as well, and then

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
