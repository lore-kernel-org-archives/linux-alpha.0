From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v3 05/13] m68k: mm: use pgtable-nopXd instead of
 4level-fixup
Date: Fri, 8 Nov 2019 17:29:58 +1300
Message-ID: <3d908bbf-0469-c53b-dd86-87df98f40ee7@gmail.com>
References: <1572850587-20314-1-git-send-email-rppt@kernel.org>
 <1572850587-20314-6-git-send-email-rppt@kernel.org>
 <CAMuHMdUG3V7uxzhbetw75vVeobeP0-bQySb3r=0V5XujUF123g@mail.gmail.com>
 <20191104094748.GB23288@rapoport-lnx>
 <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6gCR76lErJP/CRx1ODDRIscorcRLw79ZTejKRwI8KPo=; b=hykGgAKXz4p7TMv8Yig1hQjyK
	/z8NM6e4A3c6PADHVGM+PTim/Bg8OlkZ+V5hwjLVknQ3+PBibGm/MeLS8bG6RLWA1JoT54XH4Ry38
	SIkVp/cC9E3Y0rVzdXdNiBkbx5Z1+9irW/stZeaqHWXKP+fuQszKmhbbDMxSkp90df2ITKCFKumoL
	f0lqke1zgnbxPLM5W6QtdWH7IIh58EAtnHA6BaB/Q9r/fS4i1GtUiPbwnGNgCJlWyCH835BaG56L8
	PRWXzPQkSLQxaxhG6HM7x9+K33yPta7wAI3hRhkMqpafdgQbPrbdaQJjh/MosE5rB2mwpdSJDVAGa
	/aVkwYFvA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=GEvPrgPPegoWDjxGYmMInikn90DDnMAOw8xBaDl5kZA=;
 b=pGQ+a/83A9/0Nc2QLG/lrr1EYbt/bjvX3SE4LpTBgZGf0KilWjqO6VeOG6Jwcb1D23
 fj+jvlUeTjjSw255ZQykSDw3AJVbte/f/cE1oLe8M6sGNMwYNJK9ALY+tjxZheqDchxu
 uAZMm1A8J8KM9d9f92xRrv1AInfaJSQbOM4UjupIdxR+V8PDnlIAOjTNsXdQqC1CSA9i
 7NDAIlAd9wtaEkQI0UHHeMwVQpIhz75MXzB4PVA2lnJTqpyORABxoTq5C4z7RED5Jagj
 p7JTWMZQtDHju/NCEn/n/ZU5jW56e2cp+KSQRvmhV5kQrLQKAhFZLEAm61D2fgLPindm
 WN9g==
In-Reply-To: <CAMuHMdVHsNyLxhaxZcVdLvQ1PUnb=2_+ECPWVD0234V+qu+kOw@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geert Uytterhoeven <geert@linux-m68k.org>, Mike Rapoport <rppt@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>, Rolf Eike Beer <eike-kernel@sf-tec.de>, Vincent Chen <deanbo422@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>, Mark Salter <msalter@redhat.com>, Matt Turner <mattst88@gmail.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Sam Creasey <sammy@sammy.net>, Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org, linux-m68k <linux-m68k@lists.linux-m68k.org>, Greentime Hu <green.hu@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>, Linux ARM <linux>

Hi Geert,

Am 04.11.2019 um 22:53 schrieb Geert Uytterhoeven:
>>> This indeed boots fine on ARAnyM, which emulates on 68040.
>>> It would be good to have some boot testing on '020/030, too.
>>
>> To be honest, I have no idea how to to that :)
>
> Sure. This was more a request for the fellow m68k users.
> But don't worry too much about it.  If it breaks '020/'030, we can fix
> that later.

Boots fine on 030, too.

Cheers,

	Michael
