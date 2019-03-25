From: Paul Burton <paul.burton@mips.com>
Subject: Re: [PATCH 2/2] arch: add pidfd and io_uring syscalls everywhere
Date: Mon, 25 Mar 2019 17:37:11 +0000
Message-ID: <20190325173704.mun2cj2ulswv7s3i@pburton-laptop>
References: <20190325143521.34928-1-arnd@arndb.de>
 <20190325144737.703921-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxdGHDqM2Hob1Ge4ufd+xg2dLJBLXLGIts1F7o/D6L0=;
 b=ainsoJHSuV4wQILShvNFOJKL3XQ5olD9sSMos4w92z0ZAEx9VxfDXjIU5Hs6RXlY13RVBEd2eRDcTdczi690f2Rgxpd4lunYwEQPsrkliqCKuZZDndAjxEKz0Y9tnWOP8HMDgxjHwH+5Kg4DJfJbJdFYnnijGu12VCfH87Aj+fg=
In-Reply-To: <20190325144737.703921-1-arnd@arndb.de>
Content-Language: en-US
Content-ID: <925CEF0D081FD04088D61AE526A67361@namprd22.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Martin Schwidefsky <schwidefsky@de.ibm.com>

Hi Arnd,

On Mon, Mar 25, 2019 at 03:47:37PM +0100, Arnd Bergmann wrote:
> Add the io_uring and pidfd_send_signal system calls to all architectures.
>=20
> These system calls are designed to handle both native and compat tasks,
> so all entries are the same across architectures, only arm-compat and
> the generic tale still use an old format.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>%
> diff --git a/arch/mips/kernel/syscalls/syscall_n64.tbl b/arch/mips/kernel=
/syscalls/syscall_n64.tbl
> index c85502e67b44..c4a49f7d57bb 100644
> --- a/arch/mips/kernel/syscalls/syscall_n64.tbl
> +++ b/arch/mips/kernel/syscalls/syscall_n64.tbl
> @@ -338,3 +338,7 @@
>  327	n64	rseq				sys_rseq
>  328	n64	io_pgetevents			sys_io_pgetevents
>  # 329 through 423 are reserved to sync up with other architectures
> +424	common	pidfd_send_signal		sys_pidfd_send_signal
> +425	common	io_uring_setup			sys_io_uring_setup
> +426	common	io_uring_enter			sys_io_uring_enter
> +427	common	io_uring_register		sys_io_uring_register

Shouldn't these declare the ABI as "n64"?

I don't see anywhere that it would actually change the generated code,
but a comment at the top of the file says that every entry should use
"n64" and so far they all do. Did you have something else in mind here?

Thanks,
    Paul
