From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] alpha: remove osf_{readv,writev}
Date: Tue, 4 Oct 2022 16:03:40 +0200
Message-ID: <CAHmME9oSAMesW_5rQ0LM7u-yHCtKgn6THZCOEZ9DHKaSAri7dQ@mail.gmail.com>
References: <CAHk-=wjwvBc3VQMNtUVUrMBVoMPSPu26OuatZ_+1gZ2m-PmmRA@mail.gmail.com>
 <20221004135301.1420873-1-Jason@zx2c4.com> <CAKXUXMyvk6WJr2M09+=D43QocX_igoaU0-qMN-MCwQk++O=vwA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-alpha-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
        t=1664892239;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=M8Id8SmAbYgSzlRRtwgUO/TtxBOviRpHBZddWECEq2I=;
        b=K46wjlS/l4KOKURP2/0mX7GNXXR/Z94jbhpvE0ZlPrwO9ZB4ssnLEUe8ON7WIdBNK9x+08
        8F/jSDg7zLOIh/HSX0i4nMlfiA1qhdPWHIvnrmB6ING00EaPbqZ8nCsMz5Jo6QxoD6PR43
        0mvgoAkOZmNqGZK8Rbmr7M6hZu0vZq8=
In-Reply-To: <CAKXUXMyvk6WJr2M09+=D43QocX_igoaU0-qMN-MCwQk++O=vwA@mail.gmail.com>
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Kees Cook <keescook@chromium.org>, "Eric W . Biederman" <ebiederm@xmission.com>, Arnd Bergmann <arnd@arndb.de>

On Tue, Oct 4, 2022 at 4:02 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> On Tue, Oct 4, 2022 at 3:53 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> >
> > As of 987f20a9dcce ("a.out: Remove the a.out implementation"),
> > sys_osf_{readv,writev} is now the same as sys_{readv,writev}. So remove
> > the osf indirection, and point the syscall table directly at the generic
> > functions, as is done on other platforms.
> >
> > Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Eric W. Biederman <ebiederm@xmission.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> > ---
> > Only compiled and QEMU-booted with no userspace, but seems simple
> > enough?
> >
>
> This patch looks exactly the same as the patch I sent a few hours ago:

Whoops, my bad for not searching first.

Jason
