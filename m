From: David Howells <dhowells@redhat.com>
Subject: Re: [PATCH 2/2] Cleanup useless architecture versions of scatterlist.h
Date: Mon, 17 Mar 2014 13:30:16 +0000
Message-ID: <11082.1395063016@warthog.procyon.org.uk>
References: <1394837930-27731-2-git-send-email-lauraa@codeaurora.org> <1394837930-27731-1-git-send-email-lauraa@codeaurora.org>
Return-path: <linux-alpha-owner@vger.kernel.org>
In-Reply-To: <1394837930-27731-2-git-send-email-lauraa@codeaurora.org>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laura Abbott <lauraa@codeaurora.org>
Cc: dhowells@redhat.com, Mikael Starvik <starvik@axis.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Hirokazu Takata <takata@linux-m32r.org>, Koichi Yasutake <yasutake.koichi@jp.panasonic.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Simek <monstr@monstr.eu>, Chen Liqin <liqin.linux@gmail.com>, Lennox Wu <lennox.wu@gmail.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-cris-kernel@axis.com, linux-m32r@ml.linux-m32r.org, microblaze-uclinux@itee.uq.edu.au, linux-am33-list@redhat.com

Laura Abbott <lauraa@codeaurora.org> wrote:

> There's no need to have an architecture version of scatterlist.h
> if the only thing the file does is include asm-generic/scatterlist.h.
> Switch to the asm-generic versions directly.

Acked-by: David Howells <dhowells@redhat.com> [FRV and MN10300]
