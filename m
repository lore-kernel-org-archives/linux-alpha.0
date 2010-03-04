From: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: Unimplemented syscalls on Alpha
Date: Thu, 4 Mar 2010 12:51:49 -0500
Message-ID: <8bd0f97a1003040951x52b0a2e5m8b724245ab773436@mail.gmail.com>
References: <1255939868-5050-1-git-send-email-mcree@orcon.net.nz> 
	<b4198de60910190853k54267f9flcf6453d6e23f6da3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=getlYymtorFlXcIddZ7CzuG35i4vTqWnGyMaNecvWQ4=;
        b=b7EnNnldtyApp75QajVI55/Glt5OmkSOTVzlDtVMtiZQ54NMsoHdSdAP4/7pAnRVoo
         cCtYXxxNhNbSe7XEH/fF5sSETSkY5fAj9FXEEq7rZAVRhgP6Oi5PvMzYJWIN9DtOx+/w
         FeIzhRNpFm+0nPZdez60Pv/xp5xmRoQQ/O0oM=
In-Reply-To: <b4198de60910190853k54267f9flcf6453d6e23f6da3@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Matt Turner <mattst88@gmail.com>
Cc: Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 19, 2009 at 10:53, Matt Turner wrote:
> On Mon, Oct 19, 2009 at 4:11 AM, Michael Cree wrote:
>> I couldn't but help notice the increasing number of unimplemented sy=
scalls
>> on the Alpha architecture. =C2=A0I thought I might poke around to se=
e what might
>> be required to get these implemented and got a pleasant surprise whe=
n it
>> seems some only need an entry in the syscall table. =C2=A0Indeed, th=
e patch in
>> reply to this message gets preadv and pwritev going -- tested with t=
he
>> sample program at http://lkml.org/lkml/2009/4/6/535.
>
> Cool. I was looking into doing this, but I didn't know how to test th=
e syscalls.
>
> I tried to keep a list of missing syscalls here,
> http://alphalinux.org/wiki/index.php/TODO_List but as you can see it'=
s
> already out of date.
>
>> I am happy to write patches to wire up more of the syscalls, but I a=
m
>> wondering which ones are as straightforward as the preadv/pwritev ca=
se?
>> That is, do any require extra programming other than the syscall tab=
le? =C2=A0Do
>> I need to get the entries in the syscall table in the same order as =
other
>> architectures?
>
> I'm curious and unsure about this too. Patches would be great. I thin=
k
> we should figure out who we need to CC to get patches into the kernel=
,
> as neither of our maintainers have any sort of Alpha tree. I've
> noticed a few patches submitted to this list have never made it into
> the kernel, as well, maybe we should start an alpha tree?

typically if the sys_xxx entry is in common code, you dont need to
implement arch-specific stuff.  just hook them up in the system call
table.  afaik, preadv/pwritev fall into this category.

> The entries do not need to be in the same order of have the same
> number as other architectures, just once you set the number you canno=
t
> change it (without breaking the ABI).

correct ... and breaking the ABI is unacceptable
-mike
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
