From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 1/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 20:43:25 +0300
Message-ID: <547032AD-605D-46AF-9DA6-C2ECA01923E1@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <1521736598-12812-2-git-send-email-blackzert@gmail.com>
 <20180322135314.61efce938293e051e118fa46@linux-foundation.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=QZq4UFrT02MMmDvS3rVa2L5oKghNblZL+cJZh/o9UH0=;
        b=JHbHee0h53JbfZKtjVUj//P0oos2gKonfd3jDsU2XL+ui/bnVXZBBH65zIZIJFUOg7
         1/7VcqNXhE7QIDeve1TwFda4oIzW/JKlzDV+NbAJKKynq3G7/GpppSCf9/zYm2VuyRP1
         eIqsCfppiFkzU6fksNtPdReW4Jke8mmxJ2dKWNPp9uXJpsVG9DObYc85XPw1C5yNkIpA
         q4fGTyV41TIA3ehtj4bzmgeYlgDpFE+k2NTZVgo0sozT3gOTWWosGkeW0evpf+7GdaWI
         eoCN71eNSbtsZkCiqKcK2nuq4G+e3qkZlHwvSp9iTjayojLi4q0Tj1B2zTChmWDSmwjO
         RsOg==
In-Reply-To: <20180322135314.61efce938293e051e118fa46@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, kstewart@linuxfoundation.org, pombredanne@nexb.com, steve.capper@arm.com, punit.agrawal@arm.com, aneesh.kumar@linux.vnet.ibm.com, npiggin@gma


> On 22 Mar 2018, at 23:53, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 22 Mar 2018 19:36:37 +0300 Ilya Smith <blackzert@gmail.com> =
wrote:
>=20
>> include/linux/mm.h |  16 ++++--
>> mm/mmap.c          | 164 =
+++++++++++++++++++++++++++++++++++++++++++++++++++++
>=20
> You'll be wanting to update the documentation.=20
> Documentation/sysctl/kernel.txt and
> Documentation/admin-guide/kernel-parameters.txt.
>=20

Sure, thanks for pointing there. I will add few lines there after =
discussion them
here.

>> ...
>>=20
>> @@ -2268,6 +2276,9 @@ extern unsigned long =
unmapped_area_topdown(struct vm_unmapped_area_info *info);
>> static inline unsigned long
>> vm_unmapped_area(struct vm_unmapped_area_info *info)
>> {
>> +	/* How about 32 bit process?? */
>> +	if ((current->flags & PF_RANDOMIZE) && randomize_va_space > 3)
>> +		return unmapped_area_random(info);
>=20
> The handling of randomize_va_space is peculiar.  Rather than being a
> bitfield which independently selects different modes, it is treated as
> a scalar: the larger the value, the more stuff we randomize.
>=20
> I can see the sense in that (and I wonder what randomize_va_space=3D5
> will do).  But it is...  odd.
>=20
> Why did you select randomize_va_space=3D4 for this?  Is there a mode 3
> already and we forgot to document it?  Or did you leave a gap for
> something?  If the former, please feel free to fix the documentation
> (in a separate, preceding patch) while you're in there ;)
>=20

Yes, I was not sure about correct value so leaved some gap for future. =
Also
according to current implementation this value used like a scalar. But =
I=E2=80=99m
agree bitfield looks more flexible for the future. I think right now I =
can leave
3 as value for my patch and it could be fixed any time in the future. =
What
do you think about it?

>> 	if (info->flags & VM_UNMAPPED_AREA_TOPDOWN)
>> 		return unmapped_area_topdown(info);
>> 	else
>> @@ -2529,11 +2540,6 @@ int drop_caches_sysctl_handler(struct =
ctl_table *, int,
>> void drop_slab(void);
>> void drop_slab_node(int nid);
>>=20
>>=20
>> ...
>>=20
>> @@ -1780,6 +1781,169 @@ unsigned long mmap_region(struct file *file, =
unsigned long addr,
>> 	return error;
>> }
>>=20
>> +unsigned long unmapped_area_random(struct vm_unmapped_area_info =
*info)
>> +{
>=20
> This function is just dead code if CONFIG_MMU=3Dn, yes?  Let's add the
> ifdefs to make it go away in that case.
>=20

Thanks, I missed that case. I will fix it.

>> +	struct mm_struct *mm =3D current->mm;
>> +	struct vm_area_struct *vma =3D NULL;
>> +	struct vm_area_struct *visited_vma =3D NULL;
>> +	unsigned long entropy[2];
>> +	unsigned long length, low_limit, high_limit, gap_start, gap_end;
>> +	unsigned long addr =3D 0;
>> +
>> +	/* get entropy with prng */
>> +	prandom_bytes(&entropy, sizeof(entropy));
>> +	/* small hack to prevent EPERM result */
>> +	info->low_limit =3D max(info->low_limit, mmap_min_addr);
>> +
>>=20
>> ...
>>=20
>> +found:
>> +	/* We found a suitable gap. Clip it with the original =
high_limit. */
>> +	if (gap_end > info->high_limit)
>> +		gap_end =3D info->high_limit;
>> +	gap_end -=3D info->length;
>> +	gap_end -=3D (gap_end - info->align_offset) & info->align_mask;
>> +	/* only one suitable page */
>> +	if (gap_end =3D=3D  gap_start)
>> +		return gap_start;
>> +	addr =3D entropy[1] % (min((gap_end - gap_start) >> PAGE_SHIFT,
>> +							 0x10000UL));
>=20
> What does the magic 10000 mean?  Isn't a comment needed explaining =
this?
>=20
>> +	addr =3D gap_end - (addr << PAGE_SHIFT);
>> +	addr +=3D (info->align_offset - addr) & info->align_mask;
>> +	return addr;
>> +}
>>=20
>> ...
>>=20
>=20

This one what I fix by next patch. I was trying to make patches separate =
to make
it easier to understand them. This constant came from last version =
discussion=20
and honestly doesn=E2=80=99t means much. I replaced it with Architecture =
depended limit
that as I plan would be CONFIG value as well.

This value means maximum number of pages we can move away from the next
vma. The less value means less security but less memory fragmentation. =
Any way
on 64bit systems memory fragmentation is not such a big problem.

