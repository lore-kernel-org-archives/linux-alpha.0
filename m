From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Linux 6.1.27, cgroup: Instruction fault 4 with systemd
Date: Mon, 22 May 2023 11:37:38 +0200
Message-ID: <b9e52b7a6f68782707ca809a746823c0c752de5c.camel@physik.fu-berlin.de>
References: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <57622252-b409-869e-7aae-81cf61e94fda@web.de>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Scheiner <frank.scheiner@web.de>, linux-alpha@vger.kernel.org
Cc: "debian-alpha@lists.debian.org" <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>

Hello Frank!

On Mon, 2023-05-22 at 11:34 +0200, Frank Scheiner wrote:
> Maybe someone on linux-alpha has an idea what could be the reason?

Try reproducing it with libcgroup to see if it's a systemd or a kernel bug:

> https://wiki.archlinux.org/title/cgroups#Examples

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
