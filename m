From: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH 0/3] memblock: cleanup memblock_free interface
Date: Thu, 23 Sep 2021 22:45:49 +0300
Message-ID: <YUzZberbgZE+7HEo@linux.ibm.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=OlfxwL5SxCQJGsEygNnP+Bd9S5CycoibyIwI1T9qbFQ=;
 b=o2g9xUdg4iWokOSpifGukNkZK7jrG3PCnBFvuz4C7oP+gzjHDglARWvYTHBDYKWgrmUN
 nywTanPgUpTOTd5/xMfhi1L+mJwrCvVoKxej3UCLp5sG7C25GVynwAmr4q0nxjw5T5YF
 XfSS+haqO/MAAWW7EoLHEph+pIjpH8koxcOuzA2lkqyOwZ+Lt0jX5schDBGsmjxT7nCn
 nj0KpCKZ1MAIxT1dHKe+ArroeI/VY7R10b19vbUGLmbRaxdWWrC+tHtvcRU2gpGyiZee
 fQz965XLLMlLTgvc9SCxBhiIocufoeoMuCL9s+OrHLUbKOqWsHzC5EoSrMfU3XKh1xK9 Bg== 
Content-Disposition: inline
In-Reply-To: <CAHk-=wiJB8H5pZz-AKaSJ7ViRtdxQGJT7eOByp8DJx2OwZSYwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Id: <linux-alpha.vger.kernel.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Sender: "iommu" <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
To: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
Cc: devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-efi <linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, KVM list <kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-s390 <linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-um <linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kasan-dev <kasan-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, "open list:BROADCOM NVRAM DRIVER" <linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-MM <linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org>, iommu <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, alpha <linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sparc <sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linuxppc-dev <linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, linux-riscv <linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mike

Hi Linus,

On Thu, Sep 23, 2021 at 09:01:46AM -0700, Linus Torvalds wrote:
> On Thu, Sep 23, 2021 at 12:43 AM Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> >
> You need to be a LOT more careful.
> 
> From a trivial check - exactly because I looked at doing it with a
> script, and decided it's not so easy - I found cases like this:
> 
> -               memblock_free(__pa(paca_ptrs) + new_ptrs_size,
> +               memblock_free(paca_ptrs + new_ptrs_size,
> 
> which is COMPLETELY wrong.

I did use a coccinelle script that's slightly more robust that a sed you've
sent, but then I did a manual review, hence the two small patches with
fixes. Indeed I missed this one, so to be on the safe side I'll rename only
the obvious cases where coccinelle can be used reliably and leave all the
rest as it's now. If somebody cares enough they can update it later.
 
> And no, making the scripting just replace '__pa(x)' with '(void *)(x)'

These were actually manual and they are required for variables that
used as virtual addresses but have unsigned long type, like e.g.
initrd_start. So it's either __pa(x) or (void *).

-- 
Sincerely yours,
Mike.
