From: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
Date: Fri, 24 Sep 2021 08:32:21 +0300
Message-ID: <YU1i5YyldfS1HH0j@linux.ibm.com>
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
 <1101e3c7-fcb7-a632-8e22-47f4a01ea02e@csgroup.eu>
 <YUxsgN/uolhn1Ok+@linux.ibm.com>
 <96e3da9f-70ff-e5c0-ef2e-cf0b636e5695@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=LcclFexTC3W4CGWQ05F30N7TENmKQs3CWJF8lIJhAyA=;
 b=fM5r0pOd7rJd2mnURChsSfJfJrX/C+3BofObflhTYGzVXv/HEJS9Aw8BgIC//ggGIR4j
 CZ5JxdcP59VcALFL5IzVij2oY4zwlRyWWbJs8bYZFXoi5eLF6aEHqAyx0sRU0twQi+Nx
 uTzT35Ud5rz3mMLTSHcDte6njyO8gAKbwGxAXdnivxmbV3hoFkXGse9K5ImTnY3FP/yx
 Dcg6IMAClTzZSYBturZR2pFZSHk8drui/RqjiPVFtbOoDuEmvxDYqAtOWfweNAxqZrTZ
 HQI3Eeh+Tf3jj5APaqHV6+/E8KJV71sFQyUh51zWXPgx91EVjartcf89ESTdpFpWq0zU zQ== 
Content-Disposition: inline
In-Reply-To: <96e3da9f-70ff-e5c0-ef2e-cf0b636e5695-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>
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
To: Christophe Leroy <christophe.leroy-2tlSp11Fh4xulxpn9UvDqw@public.gmane.org>
Cc: linux-efi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kvm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, sparclinux-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-riscv-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-s390-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kasan-dev-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org, linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-um-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, linux-alpha-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

On Thu, Sep 23, 2021 at 03:54:46PM +0200, Christophe Leroy wrote:
> =

> Le 23/09/2021 =E0 14:01, Mike Rapoport a =E9crit=A0:
> > On Thu, Sep 23, 2021 at 11:47:48AM +0200, Christophe Leroy wrote:
> > > =

> > > =

> > > Le 23/09/2021 =E0 09:43, Mike Rapoport a =E9crit=A0:
> > > > From: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> > > > =

> > > > For ages memblock_free() interface dealt with physical addresses ev=
en
> > > > despite the existence of memblock_alloc_xx() functions that return a
> > > > virtual pointer.
> > > > =

> > > > Introduce memblock_phys_free() for freeing physical ranges and repu=
rpose
> > > > memblock_free() to free virtual pointers to make the following pair=
ing
> > > > abundantly clear:
> > > > =

> > > > 	int memblock_phys_free(phys_addr_t base, phys_addr_t size);
> > > > 	phys_addr_t memblock_phys_alloc(phys_addr_t base, phys_addr_t size=
);
> > > > =

> > > > 	void *memblock_alloc(phys_addr_t size, phys_addr_t align);
> > > > 	void memblock_free(void *ptr, size_t size);
> > > > =

> > > > Replace intermediate memblock_free_ptr() with memblock_free() and d=
rop
> > > > unnecessary aliases memblock_free_early() and memblock_free_early_n=
id().
> > > > =

> > > > Suggested-by: Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>
> > > > Signed-off-by: Mike Rapoport <rppt-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>
> > > > ---
> > > =

> > > > diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
> > > > index 1a04e5bdf655..37826d8c4f74 100644
> > > > --- a/arch/s390/kernel/smp.c
> > > > +++ b/arch/s390/kernel/smp.c
> > > > @@ -723,7 +723,7 @@ void __init smp_save_dump_cpus(void)
> > > >    			/* Get the CPU registers */
> > > >    			smp_save_cpu_regs(sa, addr, is_boot_cpu, page);
> > > >    	}
> > > > -	memblock_free(page, PAGE_SIZE);
> > > > +	memblock_phys_free(page, PAGE_SIZE);
> > > >    	diag_amode31_ops.diag308_reset();
> > > >    	pcpu_set_smt(0);
> > > >    }
> > > > @@ -880,7 +880,7 @@ void __init smp_detect_cpus(void)
> > > >    	/* Add CPUs present at boot */
> > > >    	__smp_rescan_cpus(info, true);
> > > > -	memblock_free_early((unsigned long)info, sizeof(*info));
> > > > +	memblock_free(info, sizeof(*info));
> > > >    }
> > > >    /*
> > > =

> > > I'm a bit lost. IIUC memblock_free_early() and memblock_free() where
> > > identical.
> > =

> > Yes, they were, but all calls to memblock_free_early() were using
> > __pa(vaddr) because they had a virtual address at hand.
> =

> I'm still not following. In the above memblock_free_early() was taking
> (unsigned long)info . Was it a bug ? =


Not really because s390 has pa =3D=3D va:

https://elixir.bootlin.com/linux/latest/source/arch/s390/include/asm/page.h=
#L169


-- =

Sincerely yours,
Mike.
