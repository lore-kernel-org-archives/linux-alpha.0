From: Marc Zyngier <mzyngier@freesurf.fr>
Subject: Re: Compiling latest 2.6 bk snapshot on Alpha
Date: Wed, 03 Sep 2003 16:40:31 +0200
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <wrpznhm3pgg.fsf@hina.wild-wind.fr.eu.org>
References: <20030903143157.GA17699@localhost>
Reply-To: mzyngier@freesurf.fr
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <20030903143157.GA17699@localhost> (Mathieu Chouquet-Stringer's
 message of "Wed, 3 Sep 2003 10:31:57 -0400")
List-Id: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Chouquet-Stringer <mchouque@online.fr>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Mathieu" == Mathieu Chouquet-Stringer <mchouque@online.fr> writes:

Mathieu> I've been hitting the same error every time I try to compile
Mathieu> bk current on alpha, namely the linker can't do its job on
Mathieu> .tmp_vmlinux1.  My compiler is "gcc version 3.2.3 (Debian)"
Mathieu> (but I also tried with 3.3 and 2.95), same problem.

Please check your binutils version. Here is the one I use, with great
success :

maz@panther:/mnt/i386/linux-2.5$ alpha-linux-ld --version
GNU ld version 2.13.90.0.18 20030121

	M.
-- 
Places change, faces change. Life is so very strange.
