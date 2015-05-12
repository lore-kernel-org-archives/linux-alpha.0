From: Chen Gang <xili_gchen_5257@hotmail.com>
Subject: Re: [PATCH] alpha: Wire up missing syscalls
Date: Tue, 12 May 2015 19:46:10 +0800
Message-ID: <BLU436-SMTP13466C50CCD5E9FA8482E3BB9DA0@phx.gbl>
References: <BLU436-SMTP115284EEDC94CD99F399465B9DD0@phx.gbl> <20150512085952.GC5711@tower> <BLU436-SMTP135C353F7438CDDA0249047B9DA0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP135C353F7438CDDA0249047B9DA0@phx.gbl>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Michael Cree <mcree@orcon.net.nz>, rth@twiddle.net, ink@jurassic.park.msu.ru, "mattst88@gmail.com" <mattst88@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-alpha@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 05/12/2015 07:40 PM, Chen Gang wrote:
> On 05/12/2015 04:59 PM, Michael Cree wrote:
>> On Sun, May 10, 2015 at 02:33:36AM +0800, Chen Gang wrote:
>>> The related warnings:
>>>
>>>     CALL    scripts/checksyscalls.sh
>>>   <stdin>:1238:2: warning: #warning syscall seccomp not implemented=
 [-Wcpp]
>>>   <stdin>:1241:2: warning: #warning syscall getrandom not implement=
ed [-Wcpp]
>>>   <stdin>:1244:2: warning: #warning syscall memfd_create not implem=
ented [-Wcpp]
>>>   <stdin>:1247:2: warning: #warning syscall bpf not implemented [-W=
cpp]
>>>   <stdin>:1250:2: warning: #warning syscall execveat not implemente=
d [-Wcpp]
>>
>> Chen: Have you tested the syscalls you have wired up?
>>
>=20
> Sorry, no, I didn't.
>=20
>> I have a suspicion that more is required to wire up the seccomp
>> syscall.  At least some of the other older architectures had to
>> implement some extra arch dependent support to implement the seccomp
>> syscall.  I don't know whether this is necessary or not on Alpha so
>> was wondering if this has been considered?
>>
>=20
> At present, I guess (I did not test), it will lead to sys_ni_call(), =
so
> it is really only "wire up".
>=20
>> Matt:  are you still feeding Alpha patches to Linus?  I suspect ther=
e
>> might be a few other patches other than this one submitted to
>> linux-alpha that should be applied.
>>
>=20
> I found another issue when building alpha, I guess, it is valuable to=
 be
> fixed (or there was already related patch but did not submitted?):
>=20

It is only a building issue, not a bug (for me, it is valuable to be
fixed: only move "kts.tv_nsec *=3D 1000" to "if (tv) { ... }").

>   arch/alpha/kernel/osf_sys.c: In function =91SyS_osf_settimeofday=92=
:
>   arch/alpha/kernel/osf_sys.c:1028:14: warning: =91kts.tv_nsec=92 may=
 be
> used uninitialized in this function [-Wmaybe-uninitialized]
>     kts.tv_nsec *=3D 1000;
>                 ^
>   arch/alpha/kernel/osf_sys.c:1016:18: note: =91kts=92 was declared h=
ere
>     struct timespec kts;
>                     ^


Thanks.
--=20
Chen Gang

Open, share, and attitude like air, water, and life which God blessed
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
