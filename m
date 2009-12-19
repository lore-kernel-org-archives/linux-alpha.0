From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PULL] alpha-2.6
Date: Sat, 19 Dec 2009 15:03:45 -0500
Message-ID: <b4198de60912191203s2fa8d0cfpe0db59c8c8f42fa5@mail.gmail.com>
References: <b4198de60912172315w73223eh996d32c89ac807fd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=UBzUnsPRcXdpyzKD54+P1paes6kRej6aRtu7RcJuVgs=;
        b=GG9crDO4NOCRxaH/3LtAFjFjHmMLo999RmGzBun06THHTqz/f/jaIFUmmtMUcrSiWz
         GGBewWcuktrZtdjWU4wdr0C7XnOVjOfqBYotRvsrGO+KnBNPnsxGs+Dy3bcx9QwUNzvq
         /DdowaCe2R4742a7s+NMlXWtT0WWr8ASaYg9k=
In-Reply-To: <b4198de60912172315w73223eh996d32c89ac807fd@mail.gmail.com>
Sender: linux-alpha-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-alpha@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Dec 18, 2009 at 2:15 AM, Matt Turner <mattst88@gmail.com> wrote=
:
> Hi Linus,
>
> Please pull the 'for-linus' branch from
> ssh://master.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.g=
it
> for-linus
>
> It contains some catch-up work, adding missing syscalls and perf
> support, along with the new unreachable() stuff.

Ping?

I read your -rc1 announcement and assumed this pull request was one of
the ones you were talking about.

The changes are very basic, but are nonetheless pretty important.
(latest udev doesn't run without the added inotify_init1 syscall).

> Thanks,
> Matt Turner
>
> The following changes since commit 55639353a0035052d9ea6cfe4dde0ac7fc=
bb2c9f:
> =A0Linus Torvalds (1):
> =A0 =A0 =A0 =A0Linux 2.6.33-rc1
>
> are available in the git repository at:
>
> =A0git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha-2.6.g=
it for-linus
>
> Daniele Calore (1):
> =A0 =A0 =A0alpha: Wire up missing/new syscalls
>
> David Daney (1):
> =A0 =A0 =A0alpha: Convert BUG() to use unreachable()
>
> Michael Cree (1):
> =A0 =A0 =A0alpha: Add minimal support for software performance events
>
> =A0arch/alpha/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> =A0arch/alpha/include/asm/bug.h =A0 =A0 =A0 =A0| =A0 =A03 ++-
> =A0arch/alpha/include/asm/perf_event.h | =A0 =A09 +++++++++
> =A0arch/alpha/include/asm/unistd.h =A0 =A0 | =A0 17 ++++++++++++++++-
> =A0arch/alpha/kernel/systbls.S =A0 =A0 =A0 =A0 | =A0 16 +++++++++++++=
++-
> =A05 files changed, 43 insertions(+), 3 deletions(-)
> =A0create mode 100644 arch/alpha/include/asm/perf_event.h
>
--
To unsubscribe from this list: send the line "unsubscribe linux-alpha" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
