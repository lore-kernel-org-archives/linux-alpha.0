From: Kees Cook <keescook@chromium.org>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Tue, 27 Mar 2018 16:57:43 -0700
Message-ID: <CAGXu5jLMssDHQORP_BWjmWa+VZ_eqkF_rZc1J6mHYCNbT9cG5A@mail.gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180323124806.GA5624@bombadil.infradead.org>
 <651E0DB6-4507-4DA1-AD46-9C26ED9792A8@gmail.com>
 <20180326084650.GC5652@dhcp22.suse.cz>
 <01A133F4-27DF-4AE2-80D6-B0368BF758CD@gmail.com>
 <20180327072432.GY5652@dhcp22.suse.cz>
 <0549F29C-12FC-4401-9E85-A430BC11DA78@gmail.com>
 <CAGXu5j+XXufprMaJ9GbHxD3mZ7iqUuu60-tTMC6wo2x1puYzMQ@mail.gmail.com>
 <20180327234904.GA27734@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54VIPl9p2Z6Z0FtzHs3So+lW/CvLvYlEev84tAnmMKw=; b=iaBz4zrdjLoUPs
	NzFrKdbe5TdcqJFZZVdq7mbjvhtAn7ucBnJf1MIonVV0czsO3pr/Ijt0rSuC2WyAS6yGLdpKOAzDp
	W9cn3OokY5uq+aZ+898n1Y+03p43mZ+C1/CoGocxpusi6wXPb75tYhvMjotypoqSWPhAswjJ/jKHB
	Bp17cOcdiM9+FAYS1XDwTnn0gV7KpcCSmLzJoXK3KMDA1E13kA2+zXZi8Zd4JHAvp3DdZiaQKcLGD
	ThwZWpKpt7SNO2OEy2j47R3SEXITnCtPN2S9Ym82oKU0Uzy94vd4KGfF4AW304lprxt2XZsgPCRfv
	QtKjpeWdeAyh+ama71Ww==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wFkkDx3cFYbP1YPKsvhztLJJm/CeWnrd+qNyVU5tAaM=;
 b=Z5w1zQwsp01KcK76BPtVMHxheh6LuINhiptq5OpBfUbmp51oPZpRbTdRklVC/Uh6Ne
 UUbVno7EzT9YVqZ81qBF+F4hffOkBEAZ0PC9XON2p8oF6SpAzoRXxJ/x5ChNH50ZSQAX
 CmraJy6Z7Nd7H//DnI+qsGMRYZ7+z3iiztRVN/pdPJQcMPZk8CLvaIZyrUq/m2AnZaS4
 3NZsRYPYtnk189UA3He5tnzuraLwuizSRJmuYoVbgkzW0H6rhjVNGub798XqNcCr0aoF
 CIQ6fPaS/D04FrTFTlgf94QvsZACFaIf886nAtycYyFdyyOfLOGqmdFV8YAINcrPwqc0
 +6oQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc;
 bh=wFkkDx3cFYbP1YPKsvhztLJJm/CeWnrd+qNyVU5tAaM=;
 b=ZBjYivxTF5d42jWlIatjnoNDDmbRXk4nLnPk86/aR2jvafpcW2LDc35bxEJRRSvN0Y
 a/MqLSLtOGfBW+dm2XaQRIcEsjpmz4T5V6MqNd91OkdN6gfV2scSP8jb5v2x753qHelO
 fpNN2GG7L00doQKJYRkU35hAqTJplNl+sDmBU=
In-Reply-To: <20180327234904.GA27734@bombadil.infradead.org>
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
To: Matthew Wilcox <willy@infradead.org>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Linux MIPS Mailing List <linux-mips@linux-mips.org>, Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>, linux-sh <linux-sh@vger.kernel.org>, Ilya Smith <blackzert@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Bhupesh Sharma <bhsharma@redhat.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>, Linux-MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, linux-ia64@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Andrea Arcangeli <aarcange@redhat.com>, linux-s390 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>, Hugh Dickins <hugh>

On Tue, Mar 27, 2018 at 4:49 PM, Matthew Wilcox <willy@infradead.org> wrote:
> On Tue, Mar 27, 2018 at 03:53:53PM -0700, Kees Cook wrote:
>> I agree: pushing this off to libc leaves a lot of things unprotected.
>> I think this should live in the kernel. The question I have is about
>> making it maintainable/readable/etc.
>>
>> The state-of-the-art for ASLR is moving to finer granularity (over
>> just base-address offset), so I'd really like to see this supported in
>> the kernel. We'll be getting there for other things in the future, and
>> I'd like to have a working production example for researchers to
>> study, etc.
>
> One thing we need is to limit the fragmentation of this approach.
> Even on 64-bit systems, we can easily get into a situation where there isn't
> space to map a contiguous terabyte.

FWIW, I wouldn't expect normal systems to use this. I am curious about
fragmentation vs entropy though. Are workloads with a mis of lots of
tiny allocations and TB-allocations? AIUI, glibc uses larger mmap()
regions for handling tiny mallocs().

-Kees

-- 
Kees Cook
Pixel Security
