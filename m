From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH next 01/16] arch/alpha: Use static const char * const
 where possible
Date: Tue, 14 Sep 2010 13:03:51 -0400
Message-ID: <AANLkTinwZe9-LwrZeMqjRw+FcLnjwmodbC6iTTOktd_z@mail.gmail.com>
References: <cover.1284435709.git.joe@perches.com> <3b211935182d8ac989fbdfde01fbdc25077151a9.1284435709.git.joe@perches.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=NfpmgS2Z391r8H1qWveqBMl2GOFKkP+LOokpvkQoPFU=;
        b=ELUBeJCU/NisD7e6uCqoSAv1tbS3DN+M2f7AfRGKcMogYTTZzfcfQAw907Ml2wGPCZ
         xG88XHid+p7UT4ScdkyrL+EaE+INYJ/C5ob0ivzVa+1AN0RlfJd5V4GNNeJRXEnNQJc1
         0zR2mNiVPK4m4KO+od3gu37cDBmfvkTM5BAe0=
In-Reply-To: <3b211935182d8ac989fbdfde01fbdc25077151a9.1284435709.git.joe@perches.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org

On Tue, Sep 14, 2010 at 12:23 AM, Joe Perches <joe@perches.com> wrote:
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
> =A0arch/alpha/kernel/err_ev6.c =A0 =A0| =A0 12 +++++++-----
> =A0arch/alpha/kernel/err_marvel.c | =A0 33 +++++++++++++++++---------=
-------
> =A0arch/alpha/kernel/err_titan.c =A0| =A0 35 ++++++++++++++++++++----=
-----------
> =A0arch/alpha/kernel/osf_sys.c =A0 =A0| =A0 =A04 ++--
> =A04 files changed, 46 insertions(+), 38 deletions(-)
>
> diff --git a/arch/alpha/kernel/err_ev6.c b/arch/alpha/kernel/err_ev6.=
c
> index 8ca6345..253cf1a 100644
> --- a/arch/alpha/kernel/err_ev6.c
> +++ b/arch/alpha/kernel/err_ev6.c
> @@ -90,11 +90,13 @@ static int
> =A0ev6_parse_cbox(u64 c_addr, u64 c1_syn, u64 c2_syn,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 u64 c_stat, u64 c_sts, int print)
> =A0{
> - =A0 =A0 =A0 char *sourcename[] =3D { "UNKNOWN", "UNKNOWN", "UNKNOWN=
",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"MEMORY"=
, "BCACHE", "DCACHE",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"BCACHE =
PROBE", "BCACHE PROBE" };
> - =A0 =A0 =A0 char *streamname[] =3D { "D", "I" };
> - =A0 =A0 =A0 char *bitsname[] =3D { "SINGLE", "DOUBLE" };
> + =A0 =A0 =A0 static const char * const sourcename[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "UNKNOWN", "UNKNOWN", "UNKNOWN",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "MEMORY", "BCACHE", "DCACHE",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "BCACHE PROBE", "BCACHE PROBE"
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 static const char * const streamname[] =3D { "D", "I" }=
;
> + =A0 =A0 =A0 static const char * const bitsname[] =3D { "SINGLE", "D=
OUBLE" };
> =A0 =A0 =A0 =A0int status =3D MCHK_DISPOSITION_REPORT;
> =A0 =A0 =A0 =A0int source =3D -1, stream =3D -1, bits =3D -1;
>
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_m=
arvel.c
> index 5c905aa..648ae88 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -589,22 +589,23 @@ marvel_print_pox_spl_cmplt(u64 spl_cmplt)
> =A0static void
> =A0marvel_print_pox_trans_sum(u64 trans_sum)
> =A0{
> - =A0 =A0 =A0 char *pcix_cmd[] =3D { "Interrupt Acknowledge",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Special Cyc=
le",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"I/O Read",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"I/O Write",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved / =
Device ID Message",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory Read=
",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory Writ=
e",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved / =
Alias to Memory Read Block",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved / =
Alias to Memory Write Block",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Configurati=
on Read",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Configurati=
on Write",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory Read=
 Multiple / Split Completion",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Dual Addres=
s Cycle",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory Read=
 Line / Memory Read Block",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory Writ=
e and Invalidate / Memory Write Block"
> + =A0 =A0 =A0 static const char * const pcix_cmd[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Interrupt Acknowledge",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Special Cycle",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "I/O Read",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "I/O Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved / Device ID Message",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved / Alias to Memory Read Block"=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved / Alias to Memory Write Block=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Configuration Read",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Configuration Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read Multiple / Split Completio=
n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Dual Address Cycle",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read Line / Memory Read Block",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Write and Invalidate / Memory W=
rite Block"
> =A0 =A0 =A0 =A0};
>
> =A0#define IO7__POX_TRANSUM__PCI_ADDR__S =A0 =A0 =A0 =A0 =A0(0)
> diff --git a/arch/alpha/kernel/err_titan.c b/arch/alpha/kernel/err_ti=
tan.c
> index f7ed97c..c3b3781 100644
> --- a/arch/alpha/kernel/err_titan.c
> +++ b/arch/alpha/kernel/err_titan.c
> @@ -75,8 +75,12 @@ titan_parse_p_serror(int which, u64 serror, int pr=
int)
> =A0 =A0 =A0 =A0int status =3D MCHK_DISPOSITION_REPORT;
>
> =A0#ifdef CONFIG_VERBOSE_MCHECK
> - =A0 =A0 =A0 char *serror_src[] =3D {"GPCI", "APCI", "AGP HP", "AGP =
LP"};
> - =A0 =A0 =A0 char *serror_cmd[] =3D {"DMA Read", "DMA RMW", "SGTE Re=
ad", "Reserved"};
> + =A0 =A0 =A0 static const char * const serror_src[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "GPCI", "APCI", "AGP HP", "AGP LP"
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 static const char * const serror_cmd[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "DMA Read", "DMA RMW", "SGTE Read", "Re=
served"
> + =A0 =A0 =A0 };
> =A0#endif /* CONFIG_VERBOSE_MCHECK */
>
> =A0#define TITAN__PCHIP_SERROR__LOST_UECC (1UL << 0)
> @@ -140,14 +144,15 @@ titan_parse_p_perror(int which, int port, u64 p=
error, int print)
> =A0 =A0 =A0 =A0int status =3D MCHK_DISPOSITION_REPORT;
>
> =A0#ifdef CONFIG_VERBOSE_MCHECK
> - =A0 =A0 =A0 char *perror_cmd[] =3D { "Interrupt Acknowledge", "Spec=
ial Cycle",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"I/O Rea=
d", =A0 =A0 =A0 =A0 =A0 =A0 =A0"I/O Write",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserve=
d", =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory =
Read", =A0 =A0 =A0 =A0 =A0 "Memory Write",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserve=
d", =A0 =A0 =A0 =A0 =A0 =A0 =A0"Reserved",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Configu=
ration Read", =A0 =A0"Configuration Write",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory =
Read Multiple", =A0"Dual Address Cycle",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Memory =
Read Line","Memory Write and Invalidate"
> + =A0 =A0 =A0 static const char * const perror_cmd[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Interrupt Acknowledge", "Special Cycle=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "I/O Read", =A0 =A0 =A0 =A0 =A0 =A0 "I/=
O Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved", =A0 =A0 =A0 =A0 =A0 =A0 "Re=
served",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read", =A0 =A0 =A0 =A0 =A0"Memo=
ry Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved", =A0 =A0 =A0 =A0 =A0 =A0 "Re=
served",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Configuration Read", =A0 "Configuratio=
n Write",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read Multiple", "Dual Address C=
ycle",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Memory Read Line", =A0 =A0 "Memory Wri=
te and Invalidate"
> =A0 =A0 =A0 =A0};
> =A0#endif /* CONFIG_VERBOSE_MCHECK */
>
> @@ -273,11 +278,11 @@ titan_parse_p_agperror(int which, u64 agperror,=
 int print)
> =A0 =A0 =A0 =A0int cmd, len;
> =A0 =A0 =A0 =A0unsigned long addr;
>
> - =A0 =A0 =A0 char *agperror_cmd[] =3D { "Read (low-priority)", "Read=
 (high-priority)",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Wri=
te (low-priority)",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Wri=
te (high-priority)",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Res=
erved", =A0 =A0 =A0 =A0 =A0 =A0"Reserved",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Flu=
sh", =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Fence"
> + =A0 =A0 =A0 static const char * const agperror_cmd[] =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Read (low-priority)", =A0"Read (high-p=
riority)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Write (low-priority)", "Write (high-pr=
iority)",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Reserved", =A0 =A0 =A0 =A0 =A0 =A0 "Re=
served",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Flush", =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
"Fence"
> =A0 =A0 =A0 =A0};
> =A0#endif /* CONFIG_VERBOSE_MCHECK */
>
> diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.=
c
> index 5d1e6d6..16bc1f5 100644
> --- a/arch/alpha/kernel/osf_sys.c
> +++ b/arch/alpha/kernel/osf_sys.c
> @@ -594,7 +594,7 @@ SYSCALL_DEFINE2(osf_sigstack, struct sigstack __u=
ser *, uss,
>
> =A0SYSCALL_DEFINE3(osf_sysinfo, int, command, char __user *, buf, lon=
g, count)
> =A0{
> - =A0 =A0 =A0 char *sysinfo_table[] =3D {
> + =A0 =A0 =A0 const char *sysinfo_table[] =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0utsname()->sysname,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0utsname()->nodename,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0utsname()->release,
> @@ -606,7 +606,7 @@ SYSCALL_DEFINE3(osf_sysinfo, int, command, char _=
_user *, buf, long, count)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"dummy", =A0 =A0 =A0 =A0/* secure RPC =
domain */
> =A0 =A0 =A0 =A0};
> =A0 =A0 =A0 =A0unsigned long offset;
> - =A0 =A0 =A0 char *res;
> + =A0 =A0 =A0 const char *res;
> =A0 =A0 =A0 =A0long len, err =3D -EINVAL;
>
> =A0 =A0 =A0 =A0offset =3D command-1;
> --
> 1.7.3.rc1

Thanks Joe. I'll vacuum this up.

Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
