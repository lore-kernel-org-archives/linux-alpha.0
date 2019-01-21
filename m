From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 08/29] m68k: assign syscall number for seccomp
Date: Mon, 21 Jan 2019 09:55:38 +0100
Message-ID: <CAMuHMdUH+vJ89O6-Qm1p9r6h30z2ZRred1aQd6=h0sk6xXULMQ@mail.gmail.com>
References: <20190118161835.2259170-1-arnd@arndb.de>
 <20190118161835.2259170-9-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZeVzR9Qr4Gu3gQ7WAh+Izn0oGFOKi/CQbI207E6tc4=; b=XorrTqn1a1qBHe
	oqezg8kx5JT3mzc15IU6pyotP9xwkr3Wurrtux7oy2lQJB37AlZ6cWhYvvcHQPoo8tEYiT23hiyL/
	4o1INNpfYO5MrAcH73XXdNMFmf1kqCgO0YOsp1EUvjL35K5rX2o8V+oAqdjLyFBgj8LaiNmRtu47s
	jIPwLoqa4D2Afrk8yoIkJuFzlfQNNBzlvo11Y3jaXLg3AOChl3d5g88jbilNWFzNmI4z9F9HwBxw9
	glHn0J1KdgpDWmhE515cMMTZxHsDtMsL1Hn1TIeXpBkY7+9JYc8YBBWoAqe0MRshTzHKyzpybIV8a
	q6v5WkQ6WUiIlZeIk69Q==;
In-Reply-To: <20190118161835.2259170-9-arnd@arndb.de>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, netdev <netdev@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, y2038 Mailman List <y2038@lists.linaro.org>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Firoz Khan <firoz.khan@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Fenghua Yu <fenghua.>

On Fri, Jan 18, 2019 at 5:20 PM Arnd Bergmann <arnd@arndb.de> wrote:
> Most architectures have assigned a numbers for the seccomp syscall
> even when they do not implement it.
>
> m68k is an exception here, so for consistency lets add the number.
> Unless CONFIG_SECCOMP is implemented, the system call just
> returns -ENOSYS.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
