From: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [RFC PATCH 6/6] arch: add untagged_addr definition for other
 arches
Date: Fri, 9 Mar 2018 16:47:23 +0100
Message-ID: <CAAeHK+y=_imh4uNSAg_vj3DLAeDLcVP3a4f79dNMW=Ot5oLiZQ@mail.gmail.com>
References: <cover.1520600533.git.andreyknvl@google.com>
 <89b4bb181a0622d2c581699bb3814fc041078d04.1520600533.git.andreyknvl@google.com>
 <b320ff92-43ae-a479-35aa-4257b9c5430e@arm.com>
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
	List-Owner; bh=1hRG8zN9FlTOV4T9ikUKO2Sszr+6+Ded7wf5Wtwn12k=; b=i5b7d8ynzpr5b1
	hkG5XAOmMlGCPFqCKb+wdlEL2HVx7RSe4AyVkr3uHQEV/uKBfVGfZC+0ZStOiF8yEveusoLAc7FKX
	UgZz4isYb/0bnt33k7mTx+ywWFbsnJuL6Y/Mxn839cKdFxRs0Mpj+DFtkKsN/OxVhJcFR2sW93zN/
	aDPDCYcWW/xaLHCSJiArfvgQYASVCs2zS4yXaiD3KKSJ8qkt6C002xDbUXjkTZDR3ItSkapwgpB3D
	oSJuu/8m7JAVnLpgxAI+uzWr1ntoqVBeDfrQxP+spAnB4eryWIZUq1pAz1+s4JfC0bywt+2ru5kwq
	rm701Z6RvroIHbMGTOiA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=jAAksnYYkMODsnsZbowE4/VFrct/KsJsppH3N6IgE5E=;
 b=UtibAzSDPg3Hg5hBk8M0mhG7Kp0G649HLc8j+63ikcwLMj5EOHI7aNDybftq6HDMym
 gPQudQDqqs41i1jkCgFzTYKkSFoWaA2CBCjEmjYX5r8nrtc4JO/EBXHAFvnecUELL26C
 /pt8P4whDL2PTLjzSinEq6AdlsXD43HpG74a/9/2O6rw3TEQqUH4Xem3NgrBPPBI0Jv7
 cRaaoLmGD1GhQMByIRcJLC4vCoqiByih0Xb9YxSNbn3LHn1Z32Gpr76mDgc2dCk3ARR5
 Jq3vRL2C5VHUX4c2xtptsue0bMshqLG3PSz+IhNCcBE/cjUhM1h3eRyWU3lSPm/YbwOm
 fMxw==
In-Reply-To: <b320ff92-43ae-a479-35aa-4257b9c5430e@arm.com>
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
To: Robin Murphy <robin.murphy@arm.com>
Cc: linux-mips@linux-mips.org, linux-sh@vger.kernel.org, Lee Smith <Lee.Smith@arm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Will Deacon <will.deacon@arm.com>, Paul Mackerras <paulus@samba.org>, Shaohua Li <shli@fb.com>, linux-arch@vger.kernel.org, Jacob Bramley <Jacob.Bramley@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, "James E . J . Bottomley" <jejb@parisc-linux.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>, Evgeniy Stepanov <eugenis@google.com>, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, adi-buildroot-devel@lists.sourceforge.net, Mike Rapoport <rppt@linux.vnet.ibm.com>, Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Richard Henderson <rth@twiddle.net>, linux-cris-kernel@axis.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel>

On Fri, Mar 9, 2018 at 3:16 PM, Robin Murphy <robin.murphy@arm.com> wrote:
> On 09/03/18 14:02, Andrey Konovalov wrote:
>>
>> To allow arm64 syscalls accept tagged pointers from userspace, we must
>> untag them when they are passed to the kernel. Since untagging is done in
>> generic parts of the kernel (like the mm subsystem), the untagged_addr
>> macro should be defined for all architectures.
>
>
> Would it not suffice to have an "#ifndef untagged_addr..." fallback in
> linux/uaccess.h?
>

Hi Robin!

This approach is much better, I'll try it. This will also solve the
merge issues that Arnd mentioned.

Thanks!
