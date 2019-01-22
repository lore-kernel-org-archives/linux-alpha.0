From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] 4.18-rc7 on alpha: bitsperlong issue
Date: Mon, 21 Jan 2019 23:35:26 -0800
Message-ID: <CAEdQ38Eh21eyk8LecnsR986mpTAfzU7KFHoPos1ruubLnMw3_A@mail.gmail.com>
References: <20190121161928.GA12984@gherkin.frus.com> <20190121214232.GA14964@gherkin.frus.com>
Mime-Version: 1.0
Return-path: <bounce-debian-alpha=debian-alpha=m.gmane.org@lists.debian.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tDoCWJ743CJFKg1cINYML/MiZJZ1sdVkOD6fclDikDE=;
        b=mq+frOQjm+CYfNPGrI//97C3UfGRHYFVN/5/rWcVqNqxOjmmhr2KDd9V6ysURlavze
         m9CWF3Dw3ijwWkzHnv2wYwu5EF5QJLGR4CJyrzXgMbEvPIOvW+Ip++vcSW+Zx6ZoXdcd
         hNeaep7wqjfvJWsALyKHopIw308HnCQsF+Av41ff5aOq02wgkvktbZzKl/az7umiguMO
         OBPsMBLJqBoWGi3KBVEo+bS22vZ5aXqaT9/QFPr+xb3I99Bf1mzp0BNgNqKupr5KdW0b
         1qdpVRxcOzr9kqG1WbYwEkykwNDmRs9GccT6Ez5f1J8p7jz/3m6u9rnaUV36sIvgLSfq
         amnA==
In-Reply-To: <20190121214232.GA14964@gherkin.frus.com>
Resent-Message-ID: <0KI0jLNCtVK.A.bYB.YfsRcB@bendel>
List-Id: <linux-alpha.vger.kernel.org>
List-URL: <https://lists.debian.org/debian-alpha/>
List-Post: <mailto:debian-alpha@lists.debian.org>
List-Help: <mailto:debian-alpha-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-alpha-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-alpha-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/CAEdQ38Eh21eyk8LecnsR986mpTAfzU7KFHoPos1ruubLnMw3_A@mail.gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bob Tracy <rct@gherkin.frus.com>
Cc: linux-alpha <linux-alpha@vger.kernel.org>, Debian Alpha Mailing List <debian-alpha@lists.debian.org>, Michael Cree <mcree@orcon.net.nz>

On Mon, Jan 21, 2019 at 1:42 PM Bob Tracy <rct@gherkin.frus.com> wrote:
>
> Apologies for what is essentially a repost with a proper subject header
> in the sense of trying to get the attention of people who collect/approve
> patches for submission upstream.  See my posting from earlier today
> (followup: [FTBFS] kernel 4.18-rc7 bitsperlong.h issue on alpha) for the
> back story.  As mentioned there, this patch applies cleanly to at least
> all mainline kernel source trees >= version 4.18.
>
> Further apologies for including the patch as an attachment, but I don't
> trust my mailer not to impose unintended formatting.

Thanks Bob. I've vacuumed the patch up and will include it in a pull req soon.

