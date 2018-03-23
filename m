From: Ilya Smith <blackzert@gmail.com>
Subject: Re: [RFC PATCH v2 0/2] Randomization of address chosen by mmap.
Date: Fri, 23 Mar 2018 20:25:15 +0300
Message-ID: <C43F853F-6B54-42DF-AEF2-64B22DAB8A1D@gmail.com>
References: <1521736598-12812-1-git-send-email-blackzert@gmail.com>
 <20180322135729.dbfd3575819c92c0f88c5c21@linux-foundation.org>
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=+OZYzmT42h5SnWF0OczzPVpdipxT1C1TADxUtBA1ByE=;
        b=OMlmcj8clO1OhtW8TlROXMtuSBQs3b4vYoHzLtsQSLQDhAzTFgSd1w0fWr8joiDzB1
         BrOebu8owGbjefmKhhGLmhtadNI+jqT6C3FHwwI4hdszSJT6+AZUdctz5/GY7HnAMxEP
         PzTPeHlb+xsHuDV03Di0vInH+29WPFkbJxrbmPjPx5ZrrZk1f9RpTdqr7zl1LalYD+AQ
         FmwBsIVuZXGrmaAXuzjF044CHD8t4MXd7Rfw/8gAxRPJBNHMbSUKylxwpDuK7s/ONLqz
         B3cDGGcmlWF/6wrgLqSuWV+FW9B/nj4/3iLdUbWuelWpSO81f12q4iTNVi/AlMZ51W3g
         MTDw==
In-Reply-To: <20180322135729.dbfd3575819c92c0f88c5c21@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, tony.luck@intel.com, fenghua.yu@intel.com, jhogan@kernel.org, ralf@linux-mips.org, jejb@parisc-linux.org, Helge Deller <deller@gmx.de>, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, schwidefsky@de.ibm.com, heiko.carstens@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, nyc@holomorphy.com, viro@zeniv.linux.org.uk, arnd@arndb.de, gregkh@linuxfoundation.org, deepa.kernel@gmail.com, mhocko@suse.com, hughd@google.com, kstewart@linuxfoundation.org, pombredanne@nexb.com, steve.capper@arm.com, punit.agrawal@arm.com, paul.burton@mips.com, aneesh.kumar@linux.vnet.ibm.com

Hello, Andrew

Thanks for reading this patch.

> On 22 Mar 2018, at 23:57, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Thu, 22 Mar 2018 19:36:36 +0300 Ilya Smith <blackzert@gmail.com> =
wrote:
>=20
>> Current implementation doesn't randomize address returned by mmap.
>> All the entropy ends with choosing mmap_base_addr at the process
>> creation. After that mmap build very predictable layout of address
>> space. It allows to bypass ASLR in many cases.
>=20
> Perhaps some more effort on the problem description would help.  *Are*
> people predicting layouts at present?  What problems does this cause?=20=

> How are they doing this and are there other approaches to solving the
> problem?
>=20
Sorry, I=E2=80=99ve lost it in first version. In short - memory layout =
could be easily=20
repaired by single leakage. Also any Out of Bounds error may easily be=20=

exploited according to current implementation. All because mmap choose =
address=20
just before previously allocated segment. You can read more about it =
here:=20
http://www.openwall.com/lists/oss-security/2018/02/27/5
Some test are available here https://github.com/blackzert/aslur.=20
To solve the problem Kernel should randomize address on any mmap so
attacker could never easily gain needed addresses.

> Mainly: what value does this patchset have to our users?  This reader
> is unable to determine that from the information which you have
> provided.  Full details, please.

The value of this patch is to decrease successful rate of exploitation
vulnerable applications.These could be either remote or local vectors.

