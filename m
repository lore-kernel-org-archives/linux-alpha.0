From: Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v2 00/21] Refine memblock API
Date: Wed, 25 Sep 2019 07:17:02 -0500
Message-ID: <CAHCN7xJdzEppn8-74SvzACsA25bUHGdV7v=CfS08xzSi59Z2uw@mail.gmail.com>
References: <1548057848-15136-1-git-send-email-rppt@linux.ibm.com>
 <CAHCN7x+Jv7yGPoB0Gm=TJ30ObLJduw2XomHkd++KqFEURYQcGg@mail.gmail.com>
 <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1ttrUEvVDpz2qVQwQGRp4JRxT37Niq3h8M8RboD+Kk=; b=r3mv6jDaZeQL14
	9mxquTebczSdGJD/EVOvKkiMY2CTb2lUa0dV4UWZICkP4dfuTPPxsIsOdfAahNqbzOe8tXO4aFsHF
	6zqTgii2bDpRdGbVM8MMYSGJZa4o7ZBD3CPISlHtMNH4nL2QkJO+NLaA+KYoftHvgq7f+cqfvzBv6
	Ixa3Ew8EKlZPCJICSmjycEaqkoga1PytF35mMiQCk2LitGV9G7L292QNMhI9NQzJWX8C1uov0/g0U
	Ogayjy5F9MsfUUbkCTVWKLs0WM05+JQsnwaHq2s3apKNaKHhkLQS51Kbob0K6z8T0jQzNcsFnDSO+
	h6luhzw3e6A8+m5KKdhA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4RvotBfrNK4XtLNNLx8Pazo7kMyOm8WMNbLFH6FEEU=;
 b=iUVK92GEmBGCZJyRo/Zd1KGKYtVYyBQQZ/qadZsMHtgdBqOIEJTGes/jFXUJbsxPYf
 arbgI67CVRtjqzv9KbtoPjbnRd+NNaoZROuAK65Afp+qrjeu4taq1FiOikitUOgqwDx8
 fioo5IrGYuhVH0YvNqEwrFk0OelIti4ramwaMIdGU4NyJep+562IHM+KmC8sSycW/lGl
 6hw22I7QH199NqTHihVI1jILF/7aomQpGPobiyR3J6OdLD8RebyLMuWN2U0+NXMFCX56
 jcF4Oyc8LIMBAV7TynSwH8rI44zROllFOPxhK0YNDBYQo27LHn7/o72CQFX3jXNFDaC5
 kGHQ==
In-Reply-To: <CAOMZO5A_U4aYC4XZXK1r9JaLg-eRdXy8m6z4GatQp62rK4HZ6A@mail.gmail.com>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, devicetree <devicetree@vger.kernel.org>, Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org, Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, kasan-dev <kasan-dev@googlegroups.com>, Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Mark Salter <msalter@redhat.com>, Dennis Zhou <dennis@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, Chris Healy <cphealy@gmail.com>, uclinux-h8-devel@lists.sourceforge.jp

On Wed, Sep 25, 2019 at 7:12 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Adam,
>
> On Wed, Sep 25, 2019 at 6:38 AM Adam Ford <aford173@gmail.com> wrote:
>
> > I know it's rather late, but this patch broke the Etnaviv 3D graphics
> > in my i.MX6Q.
> >
> > When I try to use the 3D, it returns some errors and the dmesg log
> > shows some memory allocation errors too:
> > [    3.682347] etnaviv etnaviv: bound 130000.gpu (ops gpu_ops)
> > [    3.688669] etnaviv etnaviv: bound 134000.gpu (ops gpu_ops)
> > [    3.695099] etnaviv etnaviv: bound 2204000.gpu (ops gpu_ops)
> > [    3.700800] etnaviv-gpu 130000.gpu: model: GC2000, revision: 5108
> > [    3.723013] etnaviv-gpu 130000.gpu: command buffer outside valid
> > memory window
> > [    3.731308] etnaviv-gpu 134000.gpu: model: GC320, revision: 5007
> > [    3.752437] etnaviv-gpu 134000.gpu: command buffer outside valid
> > memory window
>
> This looks similar to what was reported at:
> https://bugs.freedesktop.org/show_bug.cgi?id=111789
>
> Does it help if you use the same suggestion and pass cma=256M in your
> kernel command line?

I tried cma=256M and noticed the cma dump at the beginning didn't
change.  Do we need to setup a reserved-memory node like
imx6ul-ccimx6ulsom.dtsi did?

adam
