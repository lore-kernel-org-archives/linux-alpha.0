From: Oliver Falk <oliver@linux-kernel.at>
Subject: Re: Need help fixing DRM locking on Alpha
Date: Mon, 16 Feb 2009 23:19:18 +0100
Message-ID: <4999E666.4080309@linux-kernel.at>
References: <b4198de60902091343p2aa76a27vf3bc077b6d55c78e@mail.gmail.com> <20090210154355.GA27697@jurassic.park.msu.ru> <b4198de60902101518m6402171bx9142ca8c8f1f785@mail.gmail.com> <20090211154829.GA27268@jurassic.park.msu.ru> <b4198de60902121415s4b52e2ber5d814997cb4b21e4@mail.gmail.com> <611416E1-0C62-40A1-9176-31AE4961495E@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <611416E1-0C62-40A1-9176-31AE4961495E@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Cree <mcree@orcon.net.nz>
Cc: Matt Turner <mattst88@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linux-alpha@vger.kernel.org, klausman@schwarzvogel.de, Jay Estabrook <Jay.Estabrook@hp.com>

Michael Cree schrieb:
> On 13/02/2009, at 11:15 AM, Matt Turner wrote:
>> It would be great to get others to test as well. To do so,
>>
>> 1) patch libdrm using this patch.
>> 2) rebuild libdrm, and at least mesa-7.2, xorg-server-1.5.3
>> 3) patch your kernel (-29_rc series preferably) with patch in
>> http://bugzilla.kernel.org/show_bug.cgi?id=10893
>> 4) startx
> 
> Done. Applied the kernel patch and the DRM patch and installed mesa 7.3 
> and xserver 1.5.3.
> 
> Had the xserver up and going with gnome desktop on my ev67 alpha.  Seems 
> to be working fine.
> 
> Nice to see glxinfo return lots of info, and glxgears actually run 
> without locking up.  But I only got 200 whatevers per second with 
> glxgears.  I recall that it use to do 400.  Makes me wonder if I am 
> really getting hardware acceleration.  This is with a Radeon 9200 
> (RV280) graphics card.

Well. At least the patch applied and the kernel came up:

[oliver@gosa ~]$ uname -a
Linux gosa.beer.linux-kernel.at 2.6.29-0.28.rc4.git6.1axp.fc10.alpha #1 
Sat Feb 14 08:07:29 CET 2009 alpha alpha alpha GNU/Linux

It's headless, so quite hard to say if drm locking is fixed or not, at 
the moment. But it's informative for Jay, that he can try this kernel 
:-) If he has time...

-of
