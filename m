From: "Will L Givens" <wlgivens@gmail.com>
Subject: RE: Newbie: AlphaCore
Date: Fri, 17 Jul 2009 20:09:27 -0500
Message-ID: <004901ca0744$66b1f670$3415e350$@com>
References: <C58C51B8-B3C7-4A01-972E-F7165C17965D@ono.com>
Reply-To: <wlgivens@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:reply-to:from:to:references
         :in-reply-to:subject:date:message-id:mime-version:content-type
         :content-transfer-encoding:x-mailer:thread-index:content-language;
        bh=evAqXdNoDmGqMXpvSKaCvvZRvTH5IiKZKK7Jr0Nvk8I=;
        b=kx6NgiHccZeDgqogFkUCt6M5AJNEHzwmxFhnXNEvJJJZbegvgjqrcCdUsefRs7G0xW
         MW8y0kOm9kaT8PL3GBNPx4+Pi+LwpyFzUCOBt4/o6b73/a9B0gHMK8u0tEJg7w8JARum
         PTamYeGs8jzF2ZgT2Ja4Y3Fe+kLy8GMLj2R8M=
In-Reply-To: <C58C51B8-B3C7-4A01-972E-F7165C17965D@ono.com>
Content-Language: en-us
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: linux-alpha@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

- From what I understand, AlphaCore doesn=92t support 'milo'. You're go=
ing to
have to try something like NetBSD or perhaps Gentoo. Keep in mind, just
about anything that uses milo will be based on outdated palcode from DE=
C.
Will L G

-----BEGIN PGP SIGNATURE-----
Version: PGP Desktop 9.9.0 (Build 397)
Charset: utf-8

wj8DBQFKYSC8i2oEKFOCzgIRAmbzAJ9FNA6Wbue8dYg64ZGYeD4f2v+7lwCg+26W
uBOrfISkgxjoqR4fEcL4aKw=3D
=3Dwuzg
-----END PGP SIGNATURE-----

-----Original Message-----
=46rom: linux-alpha-owner@vger.kernel.org
[mailto:linux-alpha-owner@vger.kernel.org] On Behalf Of "J.A. Magall=F3=
n"
Sent: Friday, July 17, 2009 10:45
To: linux-alpha@vger.kernel.org
Subject: Newbie: AlphaCore

Hi all...

I've put my hands on an old Ruffian box (164UX), and wanted to try Linu=
x
on that alpha. I have used/managed/broken linux on x86(64) for years,
but with this alpha I'm not even able to boot the installer...

System: Samsung 164UX, 1Gb ram, 533 MHZ processor.
ARCS firmware updated to the latest (1.3.062) in
http://www.alphalinux.org/firmware/api/UX/.

I downloaded AlphaCore isos from http://buildsys.zero42.at/iso/.
It looks like it has kernel 2.6.26.

The box had an old Suse installed that I want to completely erase.
It has a fat partition for milo/ldmilo.
I cant get that milo to boot from the CD.

Questions:
- AFAIK, I can not boot from CDROM directly from ARCS. I need milo.
- Where can I get a recent milo for the ruffian ?
   I say recent, because I have read that milo is kernel dependent,
   and perhaps that old milo can't boot the kernel in the cd.
- How should I boot from the CD ?
   I have tried things like
   MILO> boot hda:
   MILO> boot hda:/boot/bootlx
   MILO> boot hda:/kernels/vlinux.gz initrd=3D/images/initrd.img

   but no luck.

In short, what should I do to boot the installer ???

TIA

--
J.A. Magallon <jamagallon()ono!com>     \               Software is =20
like sex:
                                          \         It's better when =20
it's free
Mandriva Linux release 2010.0 (Cooker) for x86_64
Linux 2.6.29.2-desktop-1mnb (gcc 4.3.2 (GCC) #1 Wed May



--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
