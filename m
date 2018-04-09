From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PULL] alpha.git
Date: Mon, 9 Apr 2018 09:46:08 -0700
Message-ID: <CAEdQ38GZ0eaM2mQwe5O3yt344+DttkmkgtBmTscWoqu=Rh9AwA@mail.gmail.com>
References: <20180408184409.GA27396@ivybridge.mattst88.com> <CA+55aFxthoBs7HiPBPDrJy-uw8MM+bM-=CZYz4Tdtn8GALUNdQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nQKXjteNTymBrHgpKSOwZ6hhmF+1NxKInm+sbCZRQ54=;
        b=nRcMwalUSuMn1GAt66lgVsHl+HGKl/+Ph6dswMqdody+p1w/lehGtcEHqYhJdEvJjo
         F425c9kZuhVG4x9EqgC4cHkJtfLLm67kg4XvgJil6V/5cg9x1pnnSfA2JKrUTaPG2ruD
         0van6l0WQ0u6zUWmjIW4aEHmbgK0qVCttblolQMCvtdCxRvmp0uKlAj2LvHX9dv3dhtg
         BQuraMZIbvPz/CL5ygNif4TFcPc7/yINV/d/XOPKhhs7WncgCiS6f7WARdi/Bm1VdXWV
         t74GWquLGfxmtwtZVQusKyIN1lkrCYTq5/R2JUbuFoW1cKRTPmHGmHk+l5NC35/Znv2X
         0jtA==
In-Reply-To: <CA+55aFxthoBs7HiPBPDrJy-uw8MM+bM-=CZYz4Tdtn8GALUNdQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sinan Kaya <okaya@codeaurora.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha <linux-alpha@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Apr 9, 2018 at 9:13 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Sun, Apr 8, 2018 at 11:44 AM, Matt Turner <mattst88@gmail.com> wrote:
>>
>> are available in the Git repository at:
>>
>>  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git
>> for you to fetch changes up to cd0e00c106722eca40b38ebf11cf134c01901086:
>
> They aren't actually where you claimed.
>
> They are in the completely unmentioned "for-linus" branch.
>
> Yes, yes, I can figure that out on my own (particularly since you gave
> me the commit for the branch head, so I can verify using "git
> ls-remote" even before pulling), but I really would like to see it in
> the pull request.
>
>               Linus

Oops. Sorry about that!
