From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Tue, 6 Apr 2021 12:19:29 +0200
Message-ID: <e6c7209e-de57-a9b8-dc23-70444aac8d1e@physik.fu-berlin.de>
References: <YFtRTqxFhXfs7r9a@gherkin.frus.com>
 <YF1k+3462hOXkI6d@gherkin.frus.com>
 <alpine.DEB.2.21.2103311059480.18977@angie.orcam.me.uk>
 <YGqWfkMbChi7G/Vj@gherkin.frus.com> <20210405045515.GA6637@tower>
 <20210405095825.GA17443@tower> <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
 <20210406091431.GA4462@tower> <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <dda17ea7-2abd-3e81-475f-8f103f7c9217@amd.com>
Content-Language: en-US
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Hi Christian!

On 4/6/21 12:15 PM, Christian König wrote:
> Am 06.04.21 um 11:14 schrieb Michael Cree:
>> On Tue, Apr 06, 2021 at 09:08:10AM +0200, Christian König wrote:
>>> That is a known issue fixed in follow up 5.11.x kernels.
>> Well, it's intriguing that you say that because the latest 5.11.x
>> kernel available from https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.kernel.org%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4bc7eae6b1c14259a35608d8f8dc6908%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532973258538981%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C2000&amp;sdata=hgwidEjS4X1IBGx7koSUTWW0y3WHAN4AT4moJvf%2BK3s%3D&amp;reserved=0 (i.e. 5.11.11) is also bad
>> and locks up hard when X is started on my Alpha XP1000.
> 
> Well *that* is rather interesting. We have considered dropping Alpha support
> because we couldn't find somebody with that hardware any more.

There are plenty of us within the Gentoo, Debian and NetBSD projects, just ask :-).

We're also supporting everything else that most commercial vendors consider obsolete
such as PA-RISC, M68k, big-endian PowerPC (32 and 64 bits) SPARC and so on, in case
you need testing there.

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

