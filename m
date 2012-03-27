From: Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH 05/14] IA64: adapt for dma_map_ops changes
Date: Tue, 27 Mar 2012 14:20:05 -0700
Message-ID: <CA+8MBbLAafFbVwviFmkjD0DNz5RsCbB_TNLL67wEi2k-hyXkXA@mail.gmail.com>
References: <1324643253-3024-1-git-send-email-m.szyprowski@samsung.com>
	<1324643253-3024-6-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <owner-linux-mm@kvack.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:date
         :x-google-sender-auth:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=AL41A/CipD4grjfRNMvDofHgBc47Ii7R4haTHNx+j7Y=;
        b=WSVbkLKVKugYFsdwKDcZJjqvNrt/vgnhT0LioOy76EHXcJB6wPViqYhRDeBqd7p1cq
         QEKKBAlC1xUresllHcMrj/8lvLF+nPvmP4AaNfS9LVUtnMlj2/oz+sy0nf0eMuS2T3NB
         PuQqDXw8v908qj0kewaU/Izw5RyaBwm+TnATyAOm6SILioR1TWuCU09a/Zu2RqGDFuR1
         LaZvSuhPCkmfZxbpeElc5K1V6myOccPhGNbJXbMJtU5R7uY6QpKJjk+S/CgaBQMY/jOh
         +iMTUsM4vuGDztZAxeWjWdXRqQNc4oGr/C5y1g6RvARS3O3imthDjIAiy+yX3tLS2dWB
         lCiQ==
In-Reply-To: <1324643253-3024-6-git-send-email-m.szyprowski@samsung.com>
Sender: owner-linux-mm@kvack.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Stephen Rothwell <sfr@canb.auug.org.au>, microblaze-uclinux@itee.uq.edu.au, linux-arch@vger.kernel.org, x86@kernel.org, linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-ia64@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org, discuss@x86-64.org, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linaro-mm-sig@lists.linaro.org, Jonathan Corbet <corbet@lwn.net>, Kyungmin Park <kyungmin.park@samsung.com>, Andrzej Pietrasiewicz <andrzej.p@samsung.com>

On Fri, Dec 23, 2011 at 4:27 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
>
> Adapt core IA64 architecture code for dma_map_ops changes: replace
> alloc/free_coherent with generic alloc/free methods.
>
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> =A0arch/ia64/hp/common/sba_iommu.c =A0 =A0 | =A0 11 ++++++-----
> =A0arch/ia64/include/asm/dma-mapping.h | =A0 18 ++++++++++++------
> =A0arch/ia64/kernel/pci-swiotlb.c =A0 =A0 =A0| =A0 =A09 +++++----
> =A0arch/ia64/sn/pci/pci_dma.c =A0 =A0 =A0 =A0 =A0| =A0 =A09 +++++----
> =A04 files changed, 28 insertions(+), 19 deletions(-)

The series breaks bisection from part 2 (when the x86 part changes
lib/swiotlb.c)
until part 5 (when ia64 sees the changes to match).  You could either merge=
 part
5 into part 2 (to make a combined x86+ia64 piece) ... or try to pull
the libswiotlb
changes into their own piece (which would have some of the ia64 and x86 bit=
s).
Or at the very least minimize the breakage window by putting ia64
right after x86
in the patch sequence.

Otherwise seems OK

Acked-by: Tony Luck <tony.luck@intel.com>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter.ca/
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>
