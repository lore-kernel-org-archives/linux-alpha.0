From: "=?UTF-8?Q?=22J.A._Magall=C3=B3n=22?=" <jamagallon@ono.com>
Subject: Newbie: AlphaCore
Date: Fri, 17 Jul 2009 17:44:45 +0200
Message-ID: <C58C51B8-B3C7-4A01-972E-F7165C17965D@ono.com>
Mime-Version: 1.0 (Apple Message framework v935.3)
Content-Transfer-Encoding: 7bit
Return-path: <linux-alpha-owner@vger.kernel.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: linux-alpha@vger.kernel.org

Hi all...

I've put my hands on an old Ruffian box (164UX), and wanted to try Linux
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
   MILO> boot hda:/kernels/vlinux.gz initrd=/images/initrd.img

   but no luck.

In short, what should I do to boot the installer ???

TIA

--
J.A. Magallon <jamagallon()ono!com>     \               Software is  
like sex:
                                          \         It's better when  
it's free
Mandriva Linux release 2010.0 (Cooker) for x86_64
Linux 2.6.29.2-desktop-1mnb (gcc 4.3.2 (GCC) #1 Wed May



