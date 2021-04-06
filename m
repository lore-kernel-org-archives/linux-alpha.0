From: Kirsten Bromilow <kirsten1@gmail.com>
Subject: Re: X11 system lockup with 5.11.0 kernel
Date: Tue, 6 Apr 2021 11:08:16 +0100
Message-ID: <77FD5DD3-70D5-4AF3-B84F-D32C5E21AB2D@gmail.com>
References: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:subject:date:message-id
         :references:cc:in-reply-to:to;
        bh=lehe72gbOHrZXXhHKC8Mkz9mp936GbJVH3bHWsr04A8=;
        b=CJx1wwRyqHvkXjvJESAa1MV4lY5b9LbGsAqU0qrFxJ8BYJNRoEa6aNwJoHWaQ1ZV7a
         aY8ifuDY9MWROEkWydzI2CUVZEmoyBpSr2x7ggFqCQX3D+5u8mrkixE1+qHUG+D1u5Cj
         4gw52a9HL7dB71utF2DInk4/iXDnJa1GJ/4/HBjxXwDkgINAEDm119o+c5jHmzrJCyNC
         OgzV9x4n9B7YI0kjV9OrDphy94oFp+4kOCwVkHKbU55pXVNqt6sFmmpChwLaGwmWiw80
         v3dplFEsSFhpCGLeeyWGHBxxiIXEKzPz1w53G6Qh7VkenPwSDkdJFe6ImID/4lbbovPK
         x5VA==
In-Reply-To: <fd607d8e-9118-a38b-62af-2c4d9f6659a0@amd.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Michael Cree <mcree@orcon.net.nz>, Bob Tracy <rct@frus.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, debian-alpha@lists.debian.org, linux-alpha@vger.kernel.org

Please stop sending these emails. They are not Relevant to me. Thanks=20

Sent from my iPhone

> On 6 Apr 2021, at 10:57, Christian K=C3=B6nig <christian.koenig@amd.com> w=
rote:
>=20
> =EF=BB=BFThat is a known issue fixed in follow up 5.11.x kernels.
>=20
> Regards,
> Christian.
>=20
>> Am 05.04.21 um 11:58 schrieb Michael Cree:
>>> On Mon, Apr 05, 2021 at 04:55:15PM +1200, Michael Cree wrote:
>>> On Sun, Apr 04, 2021 at 11:47:58PM -0500, Bob Tracy wrote:
>>>> On Wed, Mar 31, 2021 at 11:04:42AM +0200, Maciej W. Rozycki wrote:
>>>>>  I think the only feasible way of determining what has happened here i=
s
>>>>> that you track the offending change down by bisecting the upstream ker=
nel
>>>>> repository with `git bisect'.
>>>> That would normally be what I would do, and it may yet happen.  Problem=

>>>> is, I don't have a 64-bit system with enough disk space to do the kerne=
l
>>>> builds with a cross-compiler, and local (native) builds on the PWS are
>>>> taking 36+ hours each these days.  Unless I get *really* lucky with the=

>>>> bisects, the task will take a couple of weeks.
>>> Confirmed that v5.11.0 hard locks up on presenting the X-Desktop
>>> login screen whereas v5.10.0 is fine. This is on a XP1000 with
>>> a Radeon HD4350.
>> And the first bad commit is:
>>=20
>> 0fe3cf3a53b5c1205ec7d321be1185b075dff205 is the first bad commit
>> commit 0fe3cf3a53b5c1205ec7d321be1185b075dff205
>> Author: Christian K=C3=B6nig <christian.koenig@amd.com>
>> Date:   Sat Oct 24 13:12:23 2020 +0200
>>=20
>>     drm/radeon: switch to new allocator v2
>>          It should be able to handle all cases here.
>>          v2: fix debugfs as well
>>          Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>>     Reviewed-by: Madhav Chauhan <madhav.chauhan@amd.com>
>>     Tested-by: Huang Rui <ray.huang@amd.com>
>>     Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fpatchwork.freedesktop.org%2Fpatch%2F397088%2F%3Fseries%3D83051%26rev%3D=
1&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7Ce271ea2552a640dfec1408d8=
f81964a3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637532135545775310%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C2000&amp;sdata=3DUYwXgn6lAsES4q8p944kP0Y%2BGzqHRwSMXgrQvZXwXzM=
%3D&amp;reserved=3D0
>>=20
>> :040000 040000 4e643ef861b921392bc67be21a42298c91c7ff7a b36453567c3176a3c=
d50fa0b23886b0fd642560d M    drivers
>>=20
>> Cheers
>> Michael.
>=20
