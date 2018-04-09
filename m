From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PULL] alpha.git
Date: Mon, 9 Apr 2018 09:13:53 -0700
Message-ID: <CA+55aFxthoBs7HiPBPDrJy-uw8MM+bM-=CZYz4Tdtn8GALUNdQ@mail.gmail.com>
References: <20180408184409.GA27396@ivybridge.mattst88.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rkLjnbHRmgSJ/xNbCbj2AkqhowRnDPzds8xE27x7Nqc=;
        b=ShFepf8gKDlhLm3RPD+qCfAa8ZHJHVj8ynJs/TXArNvuJL8dmZAEY1DyLPSo2+yaX0
         i/1KQ1gaaDtB5LVmAE2ypkCs/jYLLjW6fawVN3V0dtEKri7GAw2AJZcjz05HPrbfeR6K
         r3cPVvONwn4l4Qr+qABqyszDzndw2Egd+l0TEHK8Fijeme3+VoGwimcrJo2Fe2zxKQUJ
         cOeJvaM8KVh2w7zIag+h5s02cAuq/ZRe6VTN76VSLTW/DRpEdPpDIBfvDKZkctU2Rnab
         1LPoTYMRY8cPJ+EQmEkb+8FIkZbeIOacGlflZ8NH1czjGfvmNuGpqi5TEn1WDO0SgaTi
         pHfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=rkLjnbHRmgSJ/xNbCbj2AkqhowRnDPzds8xE27x7Nqc=;
        b=YGSZMO6mEz3dJiGvaiL8Ltv3qXe46mAA3TF1H4q3F92gitcDmzARJH1QjcCutYndGa
         bPaiqPRay2AyG9z8ou/A8PysbNPU0YnbX6RgXWEXo6sOJxjLQrZHwS45NRdN0bvj0L8p
         XhCLXh8EFyrD8/IpK/6L0rPUNlq85ebXRuz4I=
In-Reply-To: <20180408184409.GA27396@ivybridge.mattst88.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-alpha.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matt Turner <mattst88@gmail.com>
Cc: Sinan Kaya <okaya@codeaurora.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Michael Cree <mcree@orcon.net.nz>, linux-alpha@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Apr 8, 2018 at 11:44 AM, Matt Turner <mattst88@gmail.com> wrote:
>
> are available in the Git repository at:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git
> for you to fetch changes up to cd0e00c106722eca40b38ebf11cf134c01901086:

They aren't actually where you claimed.

They are in the completely unmentioned "for-linus" branch.

Yes, yes, I can figure that out on my own (particularly since you gave
me the commit for the branch head, so I can verify using "git
ls-remote" even before pulling), but I really would like to see it in
the pull request.

              Linus
