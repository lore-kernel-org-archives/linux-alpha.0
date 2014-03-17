From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH 2/2] Cleanup useless architecture versions of
 scatterlist.h
Date: Mon, 17 Mar 2014 01:05:24 +0100
Message-ID: <20140317000524.GE25718@axis.com>
References: <1394837930-27731-1-git-send-email-lauraa@codeaurora.org>
 <1394837930-27731-2-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1394837930-27731-2-git-send-email-lauraa@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jespern@axis.com>, Hirokazu Takata <takata@linux-m32r.org>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Michal Simek <monstr@monstr.eu>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-cris-kernel <linux-cris-kernel@axis.com>, "linux-m32r@ml.linux-m32r.org" <linux-m32r@ml.linux-m32r.org>, "microblaze-uclinux@itee.uq.edu.au" <microblaze-uclinux@itee.uq.edu.au>, "linux-am33-list@redhat.com" <linux-am33-list@redhat.com>

On Fri, Mar 14, 2014 at 11:58:50PM +0100, Laura Abbott wrote:
> There's no need to have an architecture version of scatterlist.h
> if the only thing the file does is include asm-generic/scatterlist.h.
> Switch to the asm-generic versions directly.
> 
> Cc: Mikael Starvik <starvik@axis.com>

For the CRIS-part:

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> Cc: David Howells <dhowells@redhat.com>
> Cc: Hirokazu Takata <takata@linux-m32r.org>,
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Koichi Yasutake <yasutake.koichi@jp.panasonic.com>
> Cc: Chen Liqin <liqin.linux@gmail.com>,
> Cc: Lennox Wu <lennox.wu@gmail.com>
> Signed-off-by: Laura Abbott <lauraa@codeaurora.org>

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
