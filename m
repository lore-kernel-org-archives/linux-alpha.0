From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] alpha: fix ALPHA_LEGACY_START_ADDRESS and default to no
Date: Fri, 29 Oct 2010 12:09:56 -0400
Message-ID: <AANLkTinbdbXDfr3rVeaMgCxCFjpH24mSB1zF=3PujKnb@mail.gmail.com>
References: <20101029042257.GA5886@Sempron.nc.rr.com> <4CCAA12E.6020809@orcon.net.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:mime-version:received:in-reply-to
         :references:from:date:message-id:subject:to:cc:content-type
         :content-transfer-encoding;
        bh=n5+MRAHxOtMIIfwkx5y/9yNLWgMWXd3K2LHGJ0902II=;
        b=oRdjWlU6TkKqdJ1XIcC+zSni4B4YxEOmbwpCEHA3a6P90TtXwFkIF0TtiCOh0rSvWR
         ci3lRg5nYL8c8o6EDTMk0PrwegiKhRYaXq58XHM7yDLVm+xaD+nGBMqaFY7pkrA88TV2
         viu9tc9k8y42N3k/n9KOkaTD6aOdwoVgBTGec=
In-Reply-To: <4CCAA12E.6020809@orcon.net.nz>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michael Cree <mcree@orcon.net.nz>
Cc: linux-alpha@vger.kernel.org, Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>

On Fri, Oct 29, 2010 at 6:25 AM, Michael Cree <mcree@orcon.net.nz> wrot=
e:
> On 29/10/10 17:22, Matt Turner wrote:
>>
>> Kconfig.debug had ALPHA_LEGACY_START_ADDRESS twice, which seemed to =
mess
>> the whole thing up so that the only way that you could unselect
>> it was to set ALPHA_GENERIC. That is to say, setting ALPHA_TITAN
>> actually prevented unsetting ALPHA_LEGACY_START_ADDRESS, which is
>> necessary for Titan systems. WTF.
>
> I don't see what the problem is that you are trying to fix. =A0The cu=
rrent
> Kconfig is set up to automatically turn on ALPHA_LEGACY_START_ADDRESS=
 if you
> select a specific Alpha system for which it is safe to use
> ALPHA_LEGACY_START_ADDRESS and will automatically turn it off if you =
select
> one of Titan, Marvel or Wildfire. =A0If you select a Generic system t=
hen
> Kconfig enables the ALPHA_LEGACY_START_ADDRESS under the Kernel hacki=
ng menu
> so that it can be manually decided whether it should be on or off.
>
> Debian, for example, uses this to build two different generic kernels=
, one
> with the legacy start address and one without. =A0Users can choose wh=
ich
> kernel to use at install time.
>
> If I turn on Titan in the config, then the Legacy Start Address menu =
item
> disappears, and the .config file is generated with
> ALPHA_LEGACY_START_ADDRESS off. =A0This appears to me to be the corre=
ct
> behaviour.
>
> Cheers
> Michael.

This has been on my todo list for so long that I forgot myself. Turns
out we had trouble building a kernel with LEGACY_START_ADDRESS=3Dn, but
you fixed those errors in commit 3e073367a and I didn't make any
connection.

Does anyone know why ALPHA_LEGACY_START_ADDRESS is in Kconfig twice?
Is this a standard idiom that I don't know about?

I guess there's on point in unsetting this on systems that don't need
it? Does moving the kernel start address back on these systems 5MB
just remove their ability to use that memory?

So, ignore the patch.
Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
